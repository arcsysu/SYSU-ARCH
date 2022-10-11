---
layout: default
title: Build and simulate
parent: I.Familiar with gem5
nav_order: 1
---

# Build and simulate
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you will learn installation and simulation of gem5

## [Build gem5(click me)](https://www.gem5.org/documentation/general_docs/building)

You can choose **either** of three ways below.

### Setup on Ubuntu 20.04 (gem5 >= v21.0)

```
sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
    python3-dev python-is-python3 libboost-all-dev pkg-config
```

### Setup on Ubuntu 18.04 (gem5 >= v21.0)

```
sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
    python3-dev python libboost-all-dev pkg-config
```

### Using Docker

- Install Docker

For windows, [install wsl](https://docs.microsoft.com/zh-cn/windows/wsl/install) first by using

```
wsl --install 
```

then [download Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/) and install.

{: .highlight}
> `wsl` is windows subsystem for linux. You can do most of the things you can do on Linux on WSL.
> To integrate docker with wsl through `setting=>Resources=>WSL Integration`

For other systems, reference [here](https://docs.docker.com/desktop/).

- Build gem5 with Docker

First,obtain gem5 image

```
docker pull gcr.io/gem5-test/ubuntu-20.04_all-dependencies:v22-0
```

{: .highlight}
> Due to some reason, you may fail to pull that image, you can change `gcr.io` to `gcr.lank8s.cn`

Then, launch the container

```
docker run -itd -v <gem5 directiory>:/gem5 <image>
```

{: .highlight}
> using `docker images` to get info about `<image>`
> 
> using `git clone -b v22.0.0.2 https://github.com/gem5/gem5.git` to get gem5

Then,connect to the container

```
docker exec -it <container> /bin/bash
```

{: .highlight}
> using `docker ps` to get info about `<container>`

### Build

To get gem5
```
git clone -b v22.0.0.2 https://github.com/gem5/gem5.git
```

Within the root of the gem5 directory, gem5 can be built with SCons using:
```
scons build/X86/gem5.opt -j <cpu-nums>
```

## Write an insteresting app(sieve)

Write a program that outputs one single integer at the end `the number of prime numbers <= N`(at default N = 100,000,000) . Compile your program as a static binary. Note that your program must achieve O(N) complexity.

## Use gem5
- to simulate the program in gem5, these tutorials may be helpful

  - [create a simple configuration script](https://www.gem5.org/documentation/learning_gem5/part1/simple_config/)

  - [using the default configuration scripts](https://www.gem5.org/documentation/learning_gem5/part1/example_configs/)

- Run your sieve program in gem5
  
  - choose an appropriate input size
  
  > {: .highlight}
  > You should use something large enough that the application is interesting, but not too large that gem5 takes more than 10 minutes to execute a simulation.
  
  - change the CPU model from X86TimingSimpleCPU to X86MinorCPU.
  
  > {: .highlight}
  > gem5 won't compile MinorCPU by default. You need to add some modifications. gem5 use `CPU_MODELS` as a parameter in the past. Try to search the keyword `CPU_MODELS` and see what you can find out. 
  > If you search `CPU_MODELS` and you will see it in release-note.md. It tells that you should modify under `arch` dir. To simplify the exp, we give the hint that you should modify `src/arch/x86/X86CPU.py` .
  
  - Vary the CPU clock from 1GHz to 2GHz (in steps of 1GHz) with both CPU models.
  
  - Change the memory configuration from DDR3_1600_x64 to DDR3_2133_x64 (DDR3 with a faster clock)

{: .question}
> a. In each output, does `system.cpu.numCycles` times `system.clk_domain.clock` equals `simTicks` ? Why ?

{: .challenge}
> b. A single-cycle processor executes one instruction per clock cycle. A classic five-stage pipelined processor, on average, executes less than one instruction per clock cycle (due to branching). So why are processors on the market pipelined?
