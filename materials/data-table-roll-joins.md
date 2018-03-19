---
layout: page
element: notes
title: Roll joins (data.table)
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
	
#### Rolling Joins

Sometimes there are tables to be joined that can be merged on factor identifiers (site, species, etc)
but also on a continuously increasing variable (survey integer, but especially a date).

When there are no *exact* matches for the continuous index variable, the merge can either
return no result (NA), in a strict matching procedure. 

If it is desirable to have some information rather than none, you can use a *roll join.*

There are two main options for rolling joins:
	- *L*ast *O*bservation *C*arried *F*orward (LOCF)
	- nearest value
	
The `data.table` package handles these in an easy way as an option on the merge syntax.

```
library(data.table)

outdat <- as.data.table(out$data)
colls
```

If our objective is to find the nearest date when there was some precipitation.

```
# eliminate precip records with no observed precip
out0 <- outdat[value > 0]

# have to match date fields...
class(out0$date)
class(colls$fdate)
# data table: modify inside brackets
out0[, date := as.Date(date)]
# Base way: assign
# out0$date <- as.Date(out0$date)

```

Join or merge without roll - only matches on exact dates in X and Y (inner join)

```
noroll <- out0[colls, on = .(date = fdate), nomatch = 0]
```

Join with roll: take nearest matching date

```
rolldat <- out0[colls, on = .(date = fdate), roll = 'nearest']
```

Join with roll: only take nearest PRIOR to survey (LOCF)

```
rolldat2 <- out0[colls, on = .(date = fdate), roll = T]
colls
out0

```
