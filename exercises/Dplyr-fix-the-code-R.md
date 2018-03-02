---
layout: exercise
topic: dplyr
title: Fix the Code
language: R
---

This is a follow-up to
[Bee Trait Aggregation]({{ site.baseurl }}/exercises/Dplyr-bee-trait-aggregation-R)
and [Bee Table Merge]({{ site.baseurl }}/exercises/Dplyr-Bee-data-join-R).

The following code is supposed to import the bee specimen data and calculate the
average fraction parasitic bees for each site and, separately, for each experiment

```
shrub_data %>%
  mutate(volume = length * width * height) %>%
  group_by(site) %>%
  summarize(mean_volume = max(volume))
shrub_data %>%
  mutate(volume = length * width * height)
  group_by(experiment) %>%
  summarize(mean_volume = mean(volume))
```

1. Fix the errors in the code so that it does what it's supposed to
2. Add a comment to the top of the code explaining what it does
3. In a text file, discuss how you know that your fixed version of the code is
   right and how you would try to make sure it was right if the data file was
   thousands of lines long
