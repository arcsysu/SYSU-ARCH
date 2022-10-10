---
layout: default
title: Before the LAB
nav_order: 2
---

# Before the LAB
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

**There is some points you need to mind**

- **IMPORTANT:YOU NEED TO COMPLETE THIS LAB WITH GEM5 OF VERSION 22.0.0.2**

- GEM5 provides two ways of simulation (SE/FS). In this LAB, we only need to use **SE** mode.

- GEM5 provides multiple architectures. In this LAB, we use X86.

- Label `challenge` means this part of content is a little difficult, you can skip it or do your best to solve it

- In your report, you should give proper introduction about your work including answering the questions or completing the challenge part and so on.

- If you find/have some problems/tips about SYSU-ARCH, please 
  - [![Disscussions](https://img.shields.io/github/discussions/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/discussions)
  - [![Issue](https://img.shields.io/github/issues/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/issues)
  - contact `guoty9[AT]mail2.sysu.edu.cn`

## Schedule, Task, Score and Submit

### Schedule

| Deadline | LAB     |
| -------- | ------- |
| 10.26    | I && II |
| 11.9     | III     |
| 11.23    | IV      |
| 12.7     | V       |
| 12.21    | VI      |

### Task and Score

Generally speaking, for each LAB, the points of basic part is 90pts and the points of challenge part is 20pts.
The final score is the average of each LAB's point times 0.4 which means full marks of experiment part is 40pts.  

The detailed task and scoring description are as follows.

#### I Familiar with gem5

##### Build and simulate 

- [20 points] Your config file (.py) 

- [30 points] The output (include config) under the **combination** (total is 8) of these configs

| CPU             | CPU_clock | DRAM          |
| --------------- | --------- | ------------- |
| X86TimingSimpleCPU | 1GHz      | DDR3_1600_x64 |
| X86MinorCPU        | 2GHz      | DDR3_2133_x64 |

- [20 points] Your `sieve` program and corresponding `benchmark` program

- [20 points] Answer question

- [20 points] Answer question(challenge part) 

##### Malloc and Free (challenge part)

- [10 points] Any files that you made changes to implement "Malloc and Free"

- [10 points] The simulation output

#### II Hostspot Analysis

- [40 points] Your solution to correctly compile modified DAXPY program

- [40 points] The output after you add `m5_dump_reset_stats(arg1,arg2)`

- [10 points] Answer question

#### III Implement FSUBR

- [30 points] Your `benchmark` program to validate FSUBR in GEM5

- [60 points] Any files that you made changes to implement FSUBR

- [20 points] Answer question(challenge part)

#### IV Implement NMRU replacement policy

- [70 points] Any file that you made changes to implement NMRU

- [20 points] The simulation output when using NMRU

- [20 points] The detailed solution for challenge part

#### V Explore GPGPU-SIM and GEMM

- [60 points] The output of simulating GEMM template code in GPGPU-SIM

- [30 points] Answer question 

- [20 points] Tuning GEMM (challenge part)

#### VI Expore ACCEL-SIM and Cache

- [40 points] The output (stats.csv)

- [50 points] Answer question

- [20 points] Answer question (challenge part)


### Submit

To submit your work, please visit [EasyHPC](https://easyhpc.net/course/157)