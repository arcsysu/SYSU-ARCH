---
layout: default
title: Malloc and Free LAB
parent: I.Familiar with gem5
nav_order: 2
---

# Malloc and Free LAB
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you will create a simObject that focuses on "Malloc and Free" and add some functionalities for it.

{: .challenge}
> Note that Malloc and Free LAB is a challenge part

{: .highlight}
> When to rebuild gem5 ?
> 
> gem5 has config files like `.py` and `SConscript`. Some config files will influence gem5 binary(ELF file). 
> Some config files just influence gem5 runtime behavior. You need to distinguish that by yourself.
> For example, if you add some new features to gem5, rebuilding gem5 is obivous.

## Problem description

![malloc and free](../../assets/images/malloc_free/des.png)

## Build and run template simobject

{: .highlight}
> You can find template code at [here](https://github.com/arcsysu/SYSU-ARCH/tree/latest/assets/LAB1)

![src](../../assets/images/malloc_free/src.png)

![config](../../assets/images/malloc_free/config.png)

![run](../../assets/images/malloc_free/run.png)

## Your task

![task](../../assets/images/malloc_free/task.png)