---
layout: default
title: IV.Implement NMRU replacement policy
nav_order: 6
---

# IV Implement NMRU replacement policy
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you will learn to implement a cache replacement policy in GEM5

## NMRU

Replace the cache block randomly but not the recently used cache block.

## Tips About Implementing NMRU

You need to modify under dir `src/mem/cache/replacement_policies`.

As `II.1` said, you need to observe how `LRU` is implemented in GEM5.

## Compare NMRU and LRU in GEM5

Run your `sieve` program in GEM5 using NMRU or LRU and see what is the difference in the output.

{: .challenge}
> Can you write a program that runs faster (about 10% speedup) using `<RP1>` instead of `<RP2>` ? (`<RP1>` and `<RP2>` represent different replacement policy in GEM5) `challenge`

## Submit

- Any file that you made changes to implement NMRU
