---
layout: default
title: FAQ
nav_order: 99
---

# FAQ

## 1. When building GEM5, it says `You're missing the gem5 style or commit message hook...`

then you can use

```
chown -R <uid>:<gid> <gem5 directory>
```

{: .highlight}
> using `id` to get info about `<uid>` and `<gid>`

## 2. When using MinorCPU, it says `AttributeError: object 'BaseMinorCPU' has no attribute 'ArchMMU'`

That means you didn't compile MinorCPU in your GEM5. Try to figure out by reading `Hint`.

## 3. What are the scoring details of this LAB ?

At present, we didn't make a detailed grading rule. We think it will depends on how well the students finish. However, the basic rule is "the more you do, the better you finish, the higher your score".

## 4. I found this LAB is different from GEM5 101. Which should I reference?

All contents are subject to this LAB.

## 5. I found some bugs/problems in this LAB. Where should I issue them?

- [![Disscussions](https://img.shields.io/github/discussions/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/discussions)
- [![Issue](https://img.shields.io/github/issues/arcsysu/SYSU-ARCH)](https://github.com/arcsysu/SYSU-ARCH/discussions)
- contact `guoty9[AT]mail2.sysu.edu.cn`

## 6. UnicodeDecodeError: 'ascii' codec can't decode ...

Delete the Chinese comment and try again.