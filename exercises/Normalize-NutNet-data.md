---
layout: exercise
topic: 
title: Normalize Data
language: SQL
---

The [Nutrient Network](http://www.nutnet.org) is a worldwide,
collaborative manipulative experiment being conducted in grasslands 
on six continents to evaluate the influence of anthropogenic 
impacts on this major biome. There are over 100 sites which send
data to the coordinator, housed at the University of Minnesota.

These data are compiled and shared with researchers inside and outside 
the network. When the network was small (~ 6 sites), this was accomplished by 
passing CSV files around over email. However these data practices
do not scale, so a new solution had to be found. 

As a biological data manager you know that a database might be a
good solution to such a collaborative experiment. You are given a 
CSV and asked to sketch out what a schema would look like, if 
the data were to be normalized. 

1. [Download the dataset]({{ site.baseurl }}/data/NutNet-data-sample.csv) of a plot summary of the original six sites
in the Nutrient Network in 2008. Scan the columns and data
to get a feel for the types of data involved.

2. Create a schema representation for the "Plot" table. What 
columns should it hold? What are their types? 
What relations does it have to other 
tables and entities? 

3. Lay out the relations between the Plot table and tables you 
might create to hold data observed in a plot. What columns do these have? 
How are they related to each other? to the Plot table?

 4. What fields would you be sure to index so that when there are 10 years of data 
 across 100+ sites, your queries can still efficiently return your result?
 
 