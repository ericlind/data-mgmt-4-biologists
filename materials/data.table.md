---
layout: page
element: notes
title: Intro to data.table
language: R
--- 

### Introduction to `data.table`
The `data.table` package for R is the brainchild of two heavy data users
in R, one (Matt Dowle) from the financial industry, and one (Arun Srinivasan)
from genomics. Both using large amounts of data, and finding ways to code
things to go faster and more efficiently.

##### setting as data.table
A `data.table` is like `data.frame` _plus._ In fact it is also 
a data.frame, meaning whatever code you use on a data.frame (including
`dplyr` or other tidyverse code) works fine on data.table objects. 

##### Pull in data
```
bee_traits <- dbReadTable(con, "bee_traits")

library(data.table)

dat <- setDT(bee_traits)
class(dat)
dat

```

I like how `data.table` has nicely formatted print options for data.


#### i, j, by

The overarching concept of data.table is "i, j, by." 

>	i = rows to use; subsetting
> 	j	= columns to use; selecting
> 	by = columns to aggregate with

These concepts are applied within the square bracket `[ ]` select domain
as with base R.


Column selections are sort of like base, without the fussiness of the quoting:
* Select (*j*): 
    * `dat[, .(Family, genus, species, Parasitic)]`

* Filter (*i*):   
	* `dat[Family == 'Andrenidae'] # note no comma`
	* `dat[n_Lat > 0]`
	* `dat[n_Lat > 0 & Family == 'Andrenidae']`

* Mutate (set *j*): 
    * `dat[, FamCode := substr(Family, 1, 4)]`
    
In this case, in the place of selecting a column or 
set of columns for j, we are *assigning* a value to a new column. 
This operation still takes place in the j (or "SELECT") part of the 
bracket subset. However it includes a new symbol: `:=`. This 
symbol means "Set equal to."

One notable difference with `data.table` is that column definitions
or modifications and calculations are made using *assignment by reference*. 
In the internals of R, when a new column is made (for instance with
`mutate` from `dplyr`), the entire table is copied to add it. 
This can be expensive from a memory (and thus speed) perspective
when R is working with larger files. Instead, the `data.table`
approach is to make a reference which is similar to an index, 
which tells R how to calculate the field when it is needed, rather
than make a copy of the table to have it immediately available.


> Do [Exercise 2 - Bee Trait Data Basics]({{ site.baseurl }}/exercises/Dplyr-bee-trait-data-basics-R), 
but with `data.table` syntax.

#### Aggregation
This is an area of excellence for `data.table`.

* Group by: 

By placing a second comma, the "by" part of i, j, by is introduced. 

What follows the second comma is used to aggregate.

```
Famdf <- dat[, .N, Family]

```
Here is another super-useful shortcut: `.N`. This simply means
"count". But when in combination with group by variables, it becomes
a work horse of tabling.

The summary variables in aggregation can be renamed:

* Grouping:
    * `dat[, .(num_species = .N), Family]`
    

> Do [Exercise 3 - Bee Trait Aggregate]({{ site.baseurl }}/exercises/Dplyr-bee-trait-aggregation-R), 
but with `data.table` syntax.

### Joins
In data.table, the *i* in i, j, by can be a filtering statement, 
or it can be another `data.table` that is indexed to match the target 
data. This works like merge or joining:

```
specimens <- dbReadTable(con, "specimens")
specDT <- setDT(specimens)
specimens[dat, on = .(genus, species), nomatch = 0L]
```

The `nomatch` function tells data.table what to do if there is no
match for the `on` columns. The default is to keep the rows, but
set the corresponding columns to NA. The `nomatch = 0L` option results 
in non-matched rows being dropped. 

> Do [Exercise 4 - Bee Table Merge]({{ site.baseurl }}/exercises/Dplyr-Bee-data-join-R), 
but with `data.table` syntax.

### Combining operations

* Combine a series of data manipulation actions
* Intermediate variables
    * Step-wise approach 
    * Can get cumbersome with lots of variable objects in the environment

```
parasiticBees <- filter(df, Parasitic == 'Yes')
parasiticBees_byFam <- group_by(parasiticBees, Family)
parasitic_avg_emerge_byFam <- summarize(parasiticBees_byFam, 
                                 avg_emerge = mean(Pheno_mean, na.rm=TRUE))
parasitic_avg_emerge_byFam
```

Thanks to `i, j, by` data.table can do this in one step: 
filter (i), assign & select (j), aggregate by (by)

This is why data.table appeals to those used to thinking about 
SQL and relational databases, because it mimics the efficiency of SQL syntax. 

```
dat[Parasitic == 'Yes', .(avg_emerge = mean(Pheno_mean, na.rm = TRUE)), Family]
```

> Do [Exercise 5 - Bee Piping]({{ site.baseurl }}/exercises/Dplyr-piping-R), 
but with `data.table` syntax.
