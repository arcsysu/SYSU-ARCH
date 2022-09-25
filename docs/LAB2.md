---
layout: default
title: II.Implement FSUBR
nav_order: 4
---

# II Implement FSUBR
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
At this part, you will implement a missing x87 instruction (FSUBR) in GEM5.

`Hint` : You need to modify `src/arch/x86/isa/decoder/x87.isa` and `src/arch/x86/isa/insts/x87/arithmetic/subtraction.py` to implement FSUBR

## Tips about Implementing FSUBR

- Normally, the emulator itself is very complex, so we may feel that it would be difficult to modify or add our own things in the emulator. In fact, GEM5 is very extensible（OOP, Structured directory/files and assisting Python configs). And the easiest way to extend in GEM5 is imitation. For example, to implement the FSUBR instruction, we can mimic the implementation of the FSUB instruction.

- these [mannuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) may be useful for understanding x86 ISA

- this [tutorial](https://www.gem5.org/documentation/learning_gem5/gem5_101/homework-2) introduce implementing FSUBR in detail

## Test your implementation

We are providing an implementation using FSUBR.

```cpp
 // ret = in2 - in1
 float subtract(float in1, float in2)
  {
    float ret = 0.0;
    asm ("fsubr %2, %0" : "=&t" (ret) : "%0" (in1), "u" (in2));
    return ret;
  }
```

You need to test your implementation by building a `benchmark` program and run it in GEM5 to validate your implementation is right.

{: .challenge}
> In x87.isa, you may notice that some code like `Inst::FSUB1(Ed)`, what is the meaning of the content in parentheses? How do you know that?

## Submit

- Your `benchmark` program to validate FSUBR in GEM5.

- Any files that you made changes to implement FSUBR

