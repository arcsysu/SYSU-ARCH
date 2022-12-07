---
layout: default
title: Prepare benchmark
parent: A simple and interesting LAB about cache
grand_parent: VI.Explore ACCEL-SIM and Cache
nav_order: 1
---

# Prepare benchmark

ACCEL-SIM provides a repo that collects gpu apps, to get it
```
git clone https://github.com/accel-sim/gpu-app-collection.git
```

There are many benchmark in it, we only need ispass-2009 at this LAB, to build it
```
# in Docker, <CUDA_DIR>=/usr/local/cuda-11.0
export CUDA_INSTALL_PATH=<CUDA_DIR>
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
source ./src/setup_environment
make ispass-2009 -i -j -C ./src
```

To test the build
```
ls bin/<cuda-version>/release
```
If you find `ispass-2009-BFS` and `ispass-2009-NN` in the output , then the app is built successfully.

We provide data at [here](https://github.com/arcsysu/SYSU-ARCH/tree/latest/assets/LAB6).
You need to place `<data_dirs>` under `<gpu-app-collection>`.
To test the data
```
# at <gpu-app-collection>
ls data_dirs/cuda/ispass-2009
```
If you find `ispass-2009-BFS` and `ispass-2009-NN` in the output , then the data is prepared successfully.