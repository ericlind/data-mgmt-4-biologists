---
layout: exercise
topic: Version Control Basic
title: Scripting Data QC
language: R
---

*n.b. the [lecture notes]({{ site.baseurl }}/materials/data-qc) for the Scripting QC portion contain most of the piecewise code to build this exercise*

Say you are setting up a network of bird surveyors from around
the state of Minnesota. As data coordinator, you will be 
receiving files from all over the state, and be expected to 
produce a clean, consistent dataset from a multitude of submitted
observations.

Using the cleaned 'WMA-bird' dataset as a model, you decide that
the following column names and types should be standard:


Column name | Type
----- | -----
WMA	| character
date_sampled | date (YYYY-MM-DD)
latin_name | character
count_observed | integer


1. You ask each surveyor to at least make the effort to export
their data from Excel as a csv. Write a script that will read in 
each file, then check:

* to report whether the column names conform to standard
* to report whether the types conform to standard

The script should output a list of column names for the file, 
whether they match the standard names, and the type of data
according to your input procedure.

2. Write a function that will act on the `count_observed`
column in the standard data. The function should return:

* a Cleveland dotplot of the count values
* a table of individual counts (where and of what species)
 which are outside the 95% central density
of the sample. 