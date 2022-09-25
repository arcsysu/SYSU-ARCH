---
layout: default
title: Build ACCEL-SIM
parent: VI.Explore ACCEL-SIM and Cache
nav_order: 1
---

# [Build ACCEL-SIM](https://github.com/accel-sim/accel-sim-framework)

Recommend using Docker

{: .highlight}
> You may wonder why we(I) recommend using Docker. 
> Imagine that you need to install many apps and each app rely on different envs (for example, A => gcc8 and B => gcc10). 
> You will soon find that it's very complicated/impossible to build an env that all apps are compatible with each other.
> Then you will think of Docker in which each env is independent from each other.

To get docker image of ACCEL-SIM env
```
docker pull accelsim/ubuntu-18.04_cuda-11
```

To get ACCEL-SIM
```
git clone -b dev https://github.com/accel-sim/accel-sim-framework.git
```

{: .highlight}
> How to launch the container with ACCEL-SIM? Try to figure out by reading [LABI](LAB1.md)

To build ACCEL-SIM 
```
# in Docker, <CUDA_DIR>=/usr/local/cuda-11.0
export CUDA_INSTALL_PATH=<CUDA_DIR>
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-simulator/
```

To test your-built ACCEL-SIM 
```
. travis.sh
```

If you have problems about ACCEL-SIM, reference [its webpage](https://accel-sim.github.io/) first.