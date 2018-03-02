---
layout: exercise
topic: dplyr
title: Bee Trait Aggregate
language: R
---

This is a follow-up to [Bee Trait Data Basics]({{ site.baseurl }}/exercises/Dplyr-bee-trait-data-basics-R).

For data.frame `df` this `dplyr` code calculates the average day of emergence by Family:

```
Famdf <- group_by(df[!is.na(Pheno_mean)], Family)
summarize(Famdf, emerge_Julian = mean(Pheno_mean))
```

1. Modify the code to calculate and print the average emergence of a bee species in each
   Subfamily.
2. Use `max()` to determine the latest bee emergence in each Family.
