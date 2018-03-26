---
layout: exercise
topic: ggplot2
title: Chlorophyll A histogram
language: R
---

Using the lakes dataset, generate a histogram of chlorophyll A
levels in the samples. (Hint: use `geom_histogram`)

You may see a message in the console that reads:

```
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

Use the binwidth option in the `geom` function to create a 
histogram with data by bins of 10.

