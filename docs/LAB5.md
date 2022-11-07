---
layout: default
title: V.Explore GPGPU-SIM and GEMM
nav_order: 7
---

# V Explore GPGPU-SIM and GEMM
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you will tune GEMM and learn the basic use of GPGPU-SIM

![GPGPU-SIM](../assets/images/gpgpu-sim.png)

GPGPU-SIM is a simulator for CUDA program. GPGPU-SIM is a little outdated from gem5. But it is still acknowledged by academic field.

## Links about GPGPU-SIM

- [homepage](http://www.gpgpu-sim.org/)
- [github](https://github.com/accel-sim/gpgpu-sim_distribution)
- [mannual](http://gpgpu-sim.org/manual/index.php/Main_Page)

## Build GPGPU-SIM

You can choose **either** of two ways below to prepare environment for building.

### Setup on Ubuntu 18.04

```
sudo apt-get install  -y wget build-essential xutils-dev bison zlib1g-dev flex \
      libglu1-mesa-dev git g++ libssl-dev libxml2-dev libboost-all-dev git g++ \
      libxml2-dev vim python-setuptools python-dev build-essential python-pip
pip3 install pyyaml plotly psutil
wget http://developer.download.nvidia.com/compute/cuda/11.0.1/local_installers/cuda_11.0.1_450.36.06_linux.run
sh cuda_11.0.1_450.36.06_linux.run --silent --toolkit
rm cuda_11.0.1_450.36.06_linux.run
```

### Using docker(accel-sim)

To get docker image
```
docker pull accelsim/ubuntu-18.04_cuda-11
```

### Build

To get GPGPU-SIM
```
git clone git@github.com:accel-sim/gpgpu-sim_distribution.git
```

To build
```
# at <gpgpu-sim dir>
source setup_environment
make -j
```

## Use GPGPU-SIM

The following steps are all necessary.

### Comile CUDA source file

{: .highlight}
> you should add `-lcudart` flag when you use nvcc to compile

```
nvcc -lcudart <source-file> -o <binary-file>
```

### Set up environment

```
# at <gpgpu-sim dir>
. setup_environment
```

### Copy config and just run

First, choose a config you like from `<gpgpu-sim dir>`/configs/tested-cfgs.
Copy all the files under `<gpgpu-sim dir>`/configs/tested-cfgs/`<selected configs>` to the path where the binary file lies.Then go to the path where the binary file lies and just run it.

## GEMM

General Matrix Multiply (GEMM) is a common algorithm in linear algebra, machine learning, statistics, and many other domains.  It provides a more interesting trade-off space, as there are many ways to break up the computation. This includes using blocking, inner products, outer products, and systolic array techniques.

At this part of LAB, we provide a [GEMM template code](https://github.com/arcsysu/SYSU-ARCH/blob/latest/assets/LAB5/simpleGEMM_LAB.cu) of [CUDA](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html), your task is as follows:

- simulate GEMM template code in GPGPU-SIM and find out the weakness of it

{: .challenge}
> you can do whatever you want with the code except the basic test frame in order to improve the performance of the GEMM 

{: .highlight}
> `Hint` you can simulate the modified code in GPGPU-SIM to validate the improvement of performance.

{: .question}
> a. What parameters do you think should be used to evaluate GEMM performance? Why? (Try to look through the simulation output)

