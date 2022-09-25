---
layout: default
title: Modify config files
parent: A simple and interesting LAB about cache
grand_parent: VI.Explore ACCEL-SIM and Cache
nav_order: 2
---

# Modify config files

ACCEL-SIM provide predefined benchmark and we only care about `ispass-2009-BFS` and `ispass-2009-NN`.
So add following content to `<accel-sim-framework>/util/job_launching/apps/define-all-apps.yml`
```
my-ispass-2009:
    exec_dir: "$GPUAPPS_ROOT/bin/$CUDA_VERSION/release/"
    data_dirs: "$GPUAPPS_ROOT/data_dirs/cuda/ispass-2009/"
    execs:
        - ispass-2009-BFS:
            - args:  ./data/graph65536.txt
        - ispass-2009-NN:
            - args:  28
```

ACCEL-SIM provide predefined configs, and we want to add a new config GTX480S which is a little different from GTX480.
To do so, add following content to `<accel-sim-framework>/util/job_launching/configs/define-standard-cfgs.yml`
```
GTX480S:
    base_file: "$GPGPUSIM_ROOT/configs/tested-cfgs/SM2_GTX480S/gpgpusim.config"
```

If you search `<accel-sim-framework>/gpu-simulator/gpgpu-sim/configs/tested-cfgs`, there isn't SM2_GTX480S.
So we create a dir `SM2_GTX480S`, and copy all the content under `SM2_GTX480` to `SM2_GTX480S`


At first, we didn't use the power simulation. So modify both `SM2_GTX480/gpgpusim.config` and `SM2_GTX480S/gpgpusim.config` with following content (diff format)
```
156,157c156,157
< -power_simulation_enabled 1
< -gpuwattch_xml_file gpuwattch_gtx480.xml
---
> -power_simulation_enabled 0
> # -gpuwattch_xml_file gpuwattch_gtx480.xml
```

Then we want to add some change to `SM2_GTX480S/gpgpusim.config` (diff format)
```
62c62
< -gpgpu_cache:dl1  N:32:128:4,L:L:m:N:H,S:64:8,8
---
> -gpgpu_cache:dl1  S:32:128:4,L:L:m:N:H,A:64:8,8
98c98
< -gpgpu_coalesce_arch 20
---
> -gpgpu_coalesce_arch 40
```

The main difference between `GTX480` and `GTX480S` is that at `GTX480` L1 cache is normal while 
at `GTX480S` L1 cache is sector.

{: .question}
> What is sector cache?

ACCEL-SIM provide predefined output colleciton configs,we want to generate output for 
`L2_total_cache_accesses` and `L1D_total_cache_miss_rate`.
So we add changes to `<accel-sim-framework>/util/job_launching/stats/example_stats.yml` (diff format)
```
41a42,43
>     - 'L2_total_cache_accesses\s+=\s*(.*)'
>     - 'L1D_total_cache_miss_rate\s+=\s*(.*)'
```