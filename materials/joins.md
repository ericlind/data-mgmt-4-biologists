---
layout: page
element: notes
title: Joins
language: R
--- 

#### Joins

There is a taxonomy of joins or merges of different data frames which is largely derived
from SQL practice, but not always totally adhered to or clearly delineated.

* Inner: Results in a table which has corresponding values in both original tables
	- `inner_join()` (dplyr)
	-  default base merge
	- `nomatch = 0L` (data.table merge option)

* Outer: Results in a table which has a row for each original table, whether or not it has 
a corresponding row in the opposite table
	- `full_join()` (dplyr)
	- `all = T` (base merge option)
	- `nomatch = NA` (data.table merge option)
	
* Left: Results in a table with all the rows of the first table (or "table on the left"), 
with values for the second table where matching, and NA or empty where not matching
	- `left_join()` (dplyr)
	- `all.x = T` (base merge option)
	- use Outer join but with table order switched, i.e. "Y[X]" (data.table merge syntax)

* Right: Results in a table with all the rows of the second table (or table on the "right"), 
with values for the first table where matching, and NA or empty where not matching.
	- `right_join()` (dplyr)
	- `all.y = T` (base merge option)
	- X[Y] (data.table syntax)
	
* Anti: Results in a table with only those rows NOT found in the second table. 
In SQL this is a "WHERE ... NOT IN" join query
	- `anti_join()` (dplyr)
	- X[!Y] (data.table syntax)	


> Do Exercise 1: [Join fish tables]({{ site.baseurl }}/exercises/Dplyr-join-fish-tables)


#### Casting into wide form

Species data is often visualized as a matrix with sampled locations
for rows and observed species for columns, with abundances or 
other indices as the cells. 

To demonstrate this we will use the fish tables from the 
exercise above. 

First add another site with some random counts:

```
# original data is site 1
fish_counts$site <- "site1"

fish_wts$COUNT <- rpois(5, lambda=5)
#add a site name
fish_wts$site <- "site2"

#select columns and order for easy binding of dataframes
fish_wts <- select(fish_wts, fish_species, COUNT, site)

#bind rows to create a dataframe
fish2 <- rbind.data.frame(fish_counts, fish_wts)
```

The `dplyr` reshape function to go from long to wide is `spread`

```
spread(fish2, fish_species, COUNT, fill=0)
```

The `data.table` way is to use `dcast`

```
# just change weights into counts for the exercise
setnames(wts, 'wt', 'COUNT')
fish2 <- rbindlist(list(cnt, wts), idcol = 'site')
dcast(fish2, formula = site ~ fish_species, fill = 0)
```

Reshaping data from long to wide form and back again is a commonly
desired task that is often frustrating. It has also led to my
(EL's) single favorite comment on all of stack overflow: 

[How to reshape data...](https://stackoverflow.com/questions/5890584/how-to-reshape-data-from-long-to-wide-format)

![hadley comment]({{ site.baseurl }}/materials/hadley-comment.jpg)

