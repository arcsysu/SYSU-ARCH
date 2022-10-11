---
layout: default
title: Build ACCEL-SIM
parent: VI.Explore ACCEL-SIM and Cache
nav_order: 1
---

# [Build ACCEL-SIM](https://github.com/accel-sim/accel-sim-framework)

You can choose **either** of two ways below.

## Setup on Ubuntu 18.04

```
sudo apt-get install  -y wget build-essential xutils-dev bison zlib1g-dev flex \
      libglu1-mesa-dev git g++ libssl-dev libxml2-dev libboost-all-dev git g++ \
      libxml2-dev vim python-setuptools python-dev build-essential python-pip
pip3 install pyyaml plotly psutil
wget http://developer.download.nvidia.com/compute/cuda/11.0.1/local_installers/cuda_11.0.1_450.36.06_linux.run
sh cuda_11.0.1_450.36.06_linux.run --silent --toolkit
rm cuda_11.0.1_450.36.06_linux.run
```

## Using Docker 

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
> How to launch the container with ACCEL-SIM? Try to figure out by reading LABI

To build ACCEL-SIM 
```
# in Docker, <CUDA_DIR>=/usr/local/cuda-11.0
export CUDA_INSTALL_PATH=<CUDA_DIR>
export PATH=$CUDA_INSTALL_PATH/bin:$PATH
pip3 install -r requirements.txt # in docker we can skip
source ./gpu-simulator/setup_environment.sh
make -j -C ./gpu-simulator/
```

To test your-built ACCEL-SIM 
```
. travis.sh
```

If you have problems about ACCEL-SIM, reference [its webpage](https://accel-sim.github.io/) first.