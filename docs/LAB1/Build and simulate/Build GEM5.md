---
layout: default
title: Build GEM5
grand_parent: I.Familiar with GEM5
parent: Build and simulate
nav_order: 1
---

# [Build GEM5(click me)](https://www.gem5.org/documentation/general_docs/building)

Recommend using [Docker](https://www.docker.com/)

## Install Docker

For windows, [install wsl](https://docs.microsoft.com/zh-cn/windows/wsl/install) first by using

```
wsl --install 
```

then [download Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/) and install.

{: .highlight}
> `wsl` is windows subsystem for linux. You can do most of the things you can do on Linux on WSL.
> 
> To integrate docker with wsl through `setting=>Resources=>WSL Integration`

For other systems, reference [this](https://docs.docker.com/desktop/).

## Build GEM5 with Docker

First,obtain GEM5 image

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