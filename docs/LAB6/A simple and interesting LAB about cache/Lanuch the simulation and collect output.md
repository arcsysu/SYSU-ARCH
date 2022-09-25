---
layout: default
title: Lanuch the simulation and collect output
parent: A simple and interesting LAB about cache
grand_parent: VI.Explore ACCEL-SIM and Cache
nav_order: 3
---

# Lanuch the simulation and collect output
  
to launch the simulation for config GTX480 and GTX480S
```
# at <accel-sim-framework> dir
./util/job_launching/run_simulations.py -C GTX480-PTX -B my-ispass-2009 -N test1
./util/job_launching/run_simulations.py -C GTX480S-PTX -B my-ispass-2009 -N test2
```

to monitor simulation
```
# at <accel-sim-framework> dir
./util/job_launching/monitor_func_test.py -N test1
./util/job_launching/monitor_func_test.py -N test2
```

to generate output 
```
# at <accel-sim-framework> dir
./util/job_launching/get_stats.py -B my-ispass-2009 -C GTX480-PTX,GTX480S-PTX | tee stats.csv
```

Try to take a look at the `stats.csv` and focus on `L2_total_cache_accesses` `L1D_total_cache_miss_rate` `gpu_tot_ipc` .

{: .question}
> What can you find from stats.csv?
> Why does BFS and NN vary differently on `gpu_tot_ipc`? Can you provide a detailed explanation?

{: .challenge}
> Can you explain why we make those changes at `gpgpusim.config` if we want to change the L1 cache to sector?