---
layout: default
title: III.Hotspot Analysis
nav_order: 5
---

# III Hotspot Analysis
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

{: .outline}
> At this part, you will learn how to reset the output status in GEM5.

The DAXPY loop (double precision aX + Y) is an oft used operation in programs that work with matrices and vectors. The following code implements DAXPY in C++11.

```cpp
  #include <cstdio>
  #include <random>

  int main()
  {
    const int N = 1000;
    double X[N], Y[N], alpha = 0.5;
    std::random_device rd; std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(1, 2);
    for (int i = 0; i < N; ++i)
    {
      X[i] = dis(gen);
      Y[i] = dis(gen);
    }

    // Start of daxpy loop
    for (int i = 0; i < N; ++i)
    {
      Y[i] = alpha * X[i] + Y[i];
    }
    // End of daxpy loop

    double sum = 0;
    for (int i = 0; i < N; ++i)
    {
      sum += Y[i];
    }
    printf("%lf\n", sum);
    return 0;
  }
```

Usually while carrying out experiments for evaluating a design, one would like to look only at statistics for the portion of the code that is most important. To do so, typically programs are annotated so that the simulator, on reaching an annotated portion of the code, carries out functions like create a checkpoint, output and reset statistical variables.

You will add `m5_dump_reset_stats(<arg1>,<arg2>)` to the C++ code to reset stats just before the start of the DAXPY loop and just after it.

To use `m5_dump_reset_stats(<arg1>,<arg2>)`, you need to read the `util/m5/README.md` and correctly compile DAXPY program.

Run your modified DAXPY program in GEM5 and see what happens in the output.

{: .question}
> What is the difference in the output after you add `m5_dump_reset_stats(<arg1>,<arg2>)` ?

## Submit

- Your solution to correctly compile modified DAXPY program

- The output after you add `m5_dump_reset_stats(arg1,arg2)`
