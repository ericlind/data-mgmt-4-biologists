---
layout: page
element: notes
title: DT (DataTables)
language: R
---

#### Interactive data tables in html

When putting together reports or exploring data, sometimes 
point-and-click sorting and filtering are helpful.

**Key point:** These interactive features *do not* alter the 
underlying data, as with e.g. opening dataset in Excel


#### [DT](https://rstudio.github.io/DT/)

`DT` builds html widgets to display data in pretty formats.

#### Install and load library
```
install.packages('DT')
library(DT)

```

#### basic functionality: `datatable()`

*Note lack of "."*

```
library(DT)
datatable(dat)
```

Examine resulting table object, noting:

* opens in Viewer, not in Plot window (html code)
* displays 10 rows by default
* allows sorting and "searching"


#### options: filter, rows per page, etc
```
# add filter by factor or number to top of table
datatable(dat, filter = 'top')

datatable(dat, 
		rownames =  F, # displays rownames by default
		options = list(pageLength = 25)) # display 25 rows

```

Examine resulting table objects noting:

* ability to _filter_ by typing or choosing a value
* ability to adjust number of rows displayed
* scrolling within container window

See extensive customization options reference [page](https://datatables.net/reference/option/)


> Do Exercise 2: [Add DT to R-markdown]({{site.baseurl}}/exercises/DT-R)


