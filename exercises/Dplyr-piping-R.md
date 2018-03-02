---
layout: exercise
topic: dplyr
title: Bee Piping
language: R
---

This is a follow-up to
[Bee Trait Aggregation]({{ site.baseurl }}/exercises/Dplyr-bee-trait-aggregation-R)
and [Bee Table Merge]({{ site.baseurl }}/exercises/Dplyr-Bee-data-join-R).

1. Import the `sites` table from the BeeLab database into a data.frame. You
should already have `bee_traits` and `specimens` in your R environment.

	*Use `dplyr` to perform the following*
 
2. Calculate the site that has the highest bee species richness.
3. Calculate the unique number of Parasitic bees observed in each soil type.
4. For all parasitic bees in `bee_traits`, make a table showing the
number of species in each genus by Lecticity (the columns will be
something like `genus`, `Lecticity`, `count_sp`).

