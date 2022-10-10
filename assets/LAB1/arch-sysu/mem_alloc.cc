#include "arch-sysu/mem_alloc.hh"

// 使用gem5的调试机制
#include "base/logging.hh"
#include "base/trace.hh"

// 为了82行的DPRINTF，由scons根据SConscript中的DebugFlag自动生成
#include "debug/MemAlloc.hh"

namespace gem5 {

MemAlloc::MemAlloc(const MemAllocParams& params)
  : SimObject(params)
  , _allocFailureCounter(nullptr,
                         "allocFailureCounter",
                         "count of failures to allocate memory")
{
  _table.emplace_back(true, 0);
  _table.emplace_back(false, params.size);
}

int
MemAlloc::alloc(int size)
{
  auto begin = _table.begin();
  auto end = std::next(begin);

  while (end != _table.end()) {
    if (end->_busy                          // 内存段被占用
        || end->_addr - begin->_addr < size // 内存段不够大
    ) {
      begin = end, ++end;
      continue;
    }

    _table.insert(end, { true, begin->_addr + size });
    return begin->_addr;
  }

  ++_allocFailureCounter;
  return -1;
}

bool
MemAlloc::free(int ptr)
{
  auto begin = _table.begin();
  auto end = std::next(begin);

  while (end != _table.end()) {
    if (begin->_addr != ptr || !end->_busy) {
      begin = end, ++end;
      continue;
    }

    end->_busy = false;

    // 合并前后的空闲内存段
    if (!begin->_busy)
      _table.erase(begin);
    if (!std::next(end)->_busy)
      _table.erase(end);
    return true;
  }

  return false;
}

MemRequest::MemRequest(const MemRequestParams& params)
  : SimObject(params)
  , _memAlloc(params.mem_alloc)
  , _size(params.size)
  , _when(params.when)
  , _life(params.life)
  , _alloc(
      [this]() {
        _addr = _memAlloc->alloc(_size);
        if (_addr != -1)
          // 如果分配失败就不用再安排释放事件了
          schedule(_free, curTick() + _life);
        else
          // gem5提供的调试功能，MemAlloc要在SConscript中声明
          DPRINTF(MemAlloc, "fail to alloc %d\n", _size);
      },
      name() + ".alloc")
  , _free(this)
{
}

void
MemRequest::startup()
{
  schedule(_alloc, _when);
}

void
MemRequest::free()
{
  _memAlloc->free(_addr);
}

}
