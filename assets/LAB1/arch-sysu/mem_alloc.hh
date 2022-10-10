#pragma once

// 必须
#include "sim/sim_object.hh"

// 为了添加统计数据项
#include "base/statistics.hh"

// SimObject的参数类型定义头文件，由scons在构建时根据MemAlloc.py中的描述自动生成
#include "params/MemAlloc.hh"
#include "params/MemRequest.hh"

#include <list>
#include <string>

namespace gem5 {

/**
 * @brief 模拟采用首次适应算法的内存分配器
 */
class MemAlloc : public SimObject
{
public:
  MemAlloc(const MemAllocParams& params);

public:
  /**
   * @brief 申请 size 字节的内存，若分配失败返回 -1
   */
  int alloc(int size);

  /**
   * @brief 释放 ptr 指向的内存，成功返回 true
   */
  bool free(int ptr);

private:
  struct ListNode
  {
    bool _busy;
    int _addr;

    ListNode(bool busy, int addr)
      : _busy(busy)
      , _addr(addr)
    {
    }
  };
  std::list<ListNode> _table; // 内存分配表

  // 所有statistics下的类都可以直接实例化使用，输出的stats.txt会自动包含每个创建的实例
  statistics::Scalar _allocFailureCounter;
};

/**
 * @brief 内存分配请求对象
 */
class MemRequest : public SimObject
{
public:
  MemRequest(const MemRequestParams& params);

public:
  /**
   * @brief SimObject 启动时的回调方法，我们在这个方法中安排系统最初的事件
   */
  void startup() override;

private:
  MemAlloc* _memAlloc;
  int _size;
  Tick _when, _life;
  int _addr;

  void free();

  // 这里展示了两种创建Event的方法：EventFunctionWrapper和EventWrapper
  EventFunctionWrapper _alloc;
  EventWrapper<MemRequest, &MemRequest::free> _free;
};

}
