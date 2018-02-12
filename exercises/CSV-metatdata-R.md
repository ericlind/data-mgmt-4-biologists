---
layout: exercise
topic: Metadata
title: CSV Header Metadata
language: R
---

In order to ensure that the bare minimum of metadata is conveyed
with the data, in can be useful to include the metadata as a
header object at the top of a data file. This forces the end user 
to confront the metadata before the data; ignorance of the structure 
and purpose of the data from that point is an affirmative choice
rather than the default condition. 

The process of using R to add metadata to an exported data file
is surprisingly straightforward. As an example we will create a short
dataset, then attach metadata to the exported file.

The process relies on the `cat` and `writeLines` functions, which 
are `base` R functions.

#### Create some sandbox data
```r
out <- data.frame(plot = 1:20, 
                  trt = sample(LETTERS[1:4], 20, replace = T),
                  sampled = rep(seq.Date(as.Date('2018-02-02'),
                   as.Date('2018-02-06'), length.out = 5), 4),
                  response = rnorm(n = 20, mean = 50, sd = 20)
)
str(out)
```

Side note: easily generating fake data to play with is one of the 
best learning features of R. 


#### Create a header and short description
```r
header1 <- c('METADATA',
             'This file contains measurements of experimental plots at Research Garden in Feburary 2018')
cat(header1, sep='\n')
```

When you `cat` a statement, it renders it without vectorization
or the quotation marks bracketing the elements (unless you specify them 
using the `sep` argument).

#### Create detailed column descriptions ("data dictionary")
Here we will use the fact that R has certain object type classes
that are allowed. These are not necessarily the same as those allowed in
other schema - many standards to choose from! - but they map generally 
onto any sensible division of information types with most data.

```r
names(out)
unlist(lapply(out, class))

# the next bit combines the names, types, and an additional description column
header2 <- data.frame(COLUMN = names(out),
                      TYPE = unlist(lapply(out, class)),
                      DEFINITION = c('plot identifier',
                                   'treatment code; one of (A = control), (B = +5 mg PO4), (C = +5 mg NH4NO3), (D = +5 mg PO4 and +5 mg NH4NO3)',
                                   'date sampled',
                                   'dried plant mass (g)'))

```

#### Write each header, and data, adding to the end of an open data connection

The following process takes advantage of the `writeLines` function 
to append the data after the headers have been written.

```r
datestamp <- Sys.Date() # useful to indicate data export date
datafile <- file(paste0('FebBiomass-',datestamp,'.csv'), open = 'wt')
writeLines(header1, con = datafile)
write.csv(header2, datafile, row.names = F)
writeLines('DATA', con = datafile)
write.csv(out, datafile, row.names = F)
close(datafile)

```
