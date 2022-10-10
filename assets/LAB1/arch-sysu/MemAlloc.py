from m5.params import *
from m5.SimObject import SimObject


class MemAlloc(SimObject):
    type = "MemAlloc"  # 习惯上与类名相同
    cxx_header = "arch-sysu/mem_alloc.hh"  # SimObject定义的头文件
    cxx_class = "gem5::MemAlloc"  # C++类名

    # 定义我们需要的参数，等号左边的名称就对应了C++类构造函数中params的成员名
    size = Param.Int("Total avaliable memory size")


class MemRequest(SimObject):
    type = "MemRequest"
    cxx_header = "arch-sysu/mem_alloc.hh"
    cxx_class = "gem5::MemRequest"

    # 参数可以为另一个SimObject对象
    mem_alloc = Param.MemAlloc("Reference to MemAlloc object")

    size = Param.Int("Number of bytes to allocate")
    when = Param.Tick("Time at which the memory allocation is requested")
    life = Param.Tick("Time after which the allocated memory is freed")
