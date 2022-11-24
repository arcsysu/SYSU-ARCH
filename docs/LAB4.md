---
layout: default
title: IV.Implement NMRU cache replacement policy
nav_order: 6
---

# IV Implement NMRU cache replacement policy
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you are required to implement a new cache replacement policy NMRU (Not Most Recently Used) in gem5.

## What's NMRU policy ?

The NMRU policy is just slightly different from the LRU (Least Recently Used) policy. In fact, you can complete this task with only a few line changes on the original LRU source code in gem5.

Just as you learned in class, the LRU policy uses a queue to track the usage of cache block by moving the last accessed block to the head of the queue. When a miss happens and a replacement must be done, the last block in the queue will be dropped to accommodate the newly accessed block.

The NMRU differs from LRU only in the choice of the block to be replaced. In NMRU, instead of always dropping the last block in the queue, we randomly choose a block after the first one in the queue. That is, we want to keep the most recently used block.

See, very simple, right?

## Tips About Implementing NMRU

Turn to the directory `src/mem/cache/replacement_policies` in gem5 source code repository.

You need to observe how `LRU` is implemented in gem5. To be more precise, refer to two files: `lru_rp.hh` and `lru_rp.cc`.

## Compare NMRU and LRU in gem5

Run your `sieve` program in gem5 using NMRU or LRU and see what is the difference in the output.

These two articles can help you understand how to use the cache objects in gem5:

- https://www.gem5.org/documentation/general_docs/memory_system/
- https://www.gem5.org/documentation/learning_gem5/part1/cache_config/

{: .challenge}
> Write a program that has significant performance gap (approx. 10% speedup) between any two different cache policies of gem5 (not limited to NMRU and LRU). You should detail your program, policies you chose and the output statistics in your report.
