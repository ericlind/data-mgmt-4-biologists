---
layout: exercise
topic: dplyr
title: Bee Trait Data Basics
language: R
---

Connect to the BeeLab dataset on your local MySQL instance. In
R:

1. Create a connection to the database using `RMariaDB`
2. Import the `bee_traits` table into a named data frame.
3. Check the column names in the data using the function `names()`.
2. Use `str()` to show the structure of the data frame and its individual 
   columns.
3. Print out the first few rows of the data using the function `head()`.

   *Use `dplyr` to complete the remaining tasks.*
4. Select the first few rows of data from the Taxon_Author column and print it out.
5. Select the data from the Family, Subfamily, and Tribe columns and print it out.
6. Filter the data for all of the bees that are Parasitic and
   print out their genus and species.
7. Create a new data frame called `endangered_bees` which have a value 
of "endangered" in the USFWS_status column. Print it out. 