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

## **Important points need to mind**

- **IMPORTANT:YOU NEED TO COMPLETE THIS LAB WITH gem5 OF VERSION 22.0.0.2**

- gem5 provides two ways of simulation (SE/FS). In this LAB, we only need to use **SE** mode.

- gem5 provides multiple architectures. In this LAB, we use X86.

- Label `challenge` means this part of content is a little difficult, you can skip it or do your best to solve it.

- You need to write a report for each LAB. In your report, you should give proper introduction about your work including answering the questions or completing the challenge part and so on.

- If you find/have some problems/tips about SYSU-ARCH, please 
  - [![Disscussions](https://img.shields.io/github/discussions/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/discussions)
  - [![Issue](https://img.shields.io/github/issues/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/issues)
  - contact `guoty9[AT]mail2.sysu.edu.cn` or `guyh9[AT]mail2.sysu.edu.cn`

## **Schedule, Task and Score**

### **Schedule**

| Deadline | LAB     |
| -------- | ------- |
| 11.2     | I & II  |
| 11.16    | III     |
| 11.30    | IV      |
| 12.14    | V       |
| 12.28    | VI      |

### **Task and Score**

{: .highlight}
> Generally speaking, for each LAB, the points of basic part is 90pts and the points of challenge part is 20pts.
> The final score is the average of each LAB's points time 0.4 which means full marks of experiment part is 40pts.  

The detailed task and scoring description are as follows.

### I Familiar with gem5

{: .highlight}
> Build and simulate 

- [20 points] Your config file (.py) 

- [30 points] The output (include config) under the **combination** (total is 8) of these configs

| CPU             | CPU_clock | DRAM          |
| --------------- | --------- | ------------- |
| X86TimingSimpleCPU | 1GHz      | DDR3_1600_8x8 |
| X86MinorCPU        | 2GHz      | DDR3_2133_8x8 |

- [20 points] Your `sieve` program

- [20 points] Answer question a

- [20 points] Answer question b(challenge part) 

{: .highlight}
> Malloc and Free (challenge part)

- [10 points] Any files that you made changes to implement "Malloc and Free"

- [10 points] The simulation output

### II Hostspot Analysis

- [40 points] Your solution to correctly compile modified DAXPY program

- [25 points] The output after you add `m5_dump_reset_stats(arg1,arg2)`

- [25 points] Answer question a

### III Implement FSUBR

- [30 points] Your `benchmark` program to validate FSUBR in gem5

- [60 points] Any files that you made changes to implement FSUBR

- [20 points] Answer question a (challenge part)

### IV Implement NMRU replacement policy

- [60 points] Any file that you made changes to implement NMRU

- [30 points] The simulation output when using NMRU

- [20 points] The detailed solution of (challenge part)

### V Explore GPGPU-SIM and GEMM

- [50 points] The output of simulating GEMM template code in GPGPU-SIM

- [40 points] Answer question a

- [20 points] Tuning GEMM (challenge part)

### VI Expore ACCEL-SIM and Cache

- [40 points] The output (stats.csv)

- [50 points] Answer question a and b

- [20 points] Answer question c (challenge part)

## **Submit**

To submit your work, please visit [EasyHPC](https://easyhpc.net/course/157)