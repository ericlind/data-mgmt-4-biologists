---
layout: exercise
topic: Workflow with git and R Studio
title: Read in data
language: R
---

After your hard work helping your colleague prepare for the 2018
field season by rearranging their data, you receive a revised 
dataset for 2016. Your colleague has asked that you
make sure you can read in this format and work with it in R
before tackling the rearrangement of the 2017 data. 

1. Download the [cleaned 2016 WMA bird dataset]({{ site.baseurl }}/data/wma-bird-data-2016.csv)
and save it to the /data directory in your working directory.

2. Read in the dataset using `read.csv()`, and assign it to a named object.

3. Using the `str()` function, examine the structure of the 
imported dataset. Do the field types appear to be correct?

4. type the name of the object at the console and hit enter. Is
what is provided useful?

5. examine the first few rows of data using the `head()` function.

6. Create a new object from only the first 100 rows of data. Export
this new object to a file called `wma-bird-data-2016-first100.csv`.

