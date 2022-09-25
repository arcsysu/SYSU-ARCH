---
layout: default
title: Use GEM5
grand_parent: I.Familiar with GEM5
parent: Build and simulate
nav_order: 3
---

# Use GEM5
- to simulate the program in GEM5, these tutorials may be helpful

  - [create a simple configuration script](https://www.gem5.org/documentation/learning_gem5/part1/simple_config/)

  - [using the default configuration scripts](https://www.gem5.org/documentation/learning_gem5/part1/example_configs/)

- Run your sieve program in GEM5
  
  - choose an appropriate input size
  
  > {: .highlight}
  > You should use something large enough that the application is interesting, but not too large that gem5 takes more than 10 minutes to execute a simulation.
  
  - change the CPU model from X86TimingSimpleCPU to X86MinorCPU.
  
  > {: .highlight}
  > GEM5 won't compile MinorCPU by default. You need to add some modifications. GEM5 use `CPU_MODELS` as a parameter in the past. Try to search the keyword `CPU_MODELS` and see what you can find out. 
  > If you search `CPU_MODELS` and you will see it in release-note.md. It tells that you should modify under `arch` dir. To simplify the exp, we give the hint that you should modify `src/arch/x86/X86CPU.py` .
  
  - Vary the CPU clock from 1GHz to 2GHz (in steps of 1GHz) with both CPU models.
  
  - Change the memory configuration from DDR3_1600_x64 to DDR3_2133_x64 (DDR3 with a faster clock)

{: .question}
> In each output, does `system.cpu.numCycles` times `system.clk_domain.clock` equals `simTicks` ? Why ?