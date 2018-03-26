---
layout: page
element: notes
title: Graphing using ggplot
language: R
---

### Data

To explore visualizations, we will generate some new data to play with.

One of the best things about R is its ability to simulate realistic
data through randomization and factorization.

We will simulate a lakes experiment testing 3 treatments 
at 22 lakes across four sample rounds through a growing season.


```
library(ggplot2)
library(data.table)

# First, we create vectors of factor levels
trt <- 1:3
lakes <- 200:221
sample_round <- 1:4

# Second, use expand.grid to make identifier frame
dat <- data.table(expand.grid(trt, lakes, sample_round))
class(dat)
str(dat)
setnames(dat, c('trt','lake', 'sample_round'))
# make lake and trt and sample rounds factors
dat[, lake := factor(lake)]
dat[, sample_round := factor(sample_round)]
dat[, trt := factor(trt)]

# summary table of observations
dat[, .N, .(lake, trt)]

# Finally, we generate some random data.
# Chlorophyll A measured by a spectrophotometer:
dat[, chlA := rnorm(.N, mean = (150 + (10*trt)), sd = 15)]

# Algal species richness measured by microscopic ID:
dat[, algal_sp := rpois(.N, lambda = 4 + (-trt))]
```

Now that we have our data, let's visualize!


### Basics

* [`ggplot()`](http://docs.ggplot2.org/current/ggplot.html) arguments:
    * default dataset - what data are we working with
    * set of mappings
        * 'Aesthetics' from variables
		* what columns should we use for different aspects of the plot

* Add components of figures with layers and '+' sign
	* [`geom_histogram()`](http://ggplot2.tidyverse.org/reference/geom_histogram.html)


First we specify an 'aesthetic'. The plot is based on the 
chosen data, and columns. The plot places an x axis that spans
the range of the algal species data, but no actual data are plotted.

```
p <- ggplot(dat, aes(algal_sp))
p
```

After we have created a ggplot object, we can then show the data. 
This is called by a "+" following immediately after each object. 

How the data are displayed, are described by geometries (`geom_` functions).

For instance, `geom_bar` creates a filled barplot layer:

```
p + geom_bar()
```

> Do [Exercise 2 - Chlorophyll A histogram]({{ site.baseurl }}/exercises/Graphing-chla-histogram-R).

Nearly immediately in any dataset, a question is how one variable
changes with another. Especially with continuous and factor variables,
this is a good way to check for outliers.

In `ggplot2` syntax, the definition of the `x` and `y` variables
are done in the `ggplot()` function, `aes()` argument:

```
p <- ggplot(dat, aes(x=trt, y=chlA)) 
p + geom_point()
```

Here we use the `geom_point` layer to view *all* the data. To summarize
the data statistically we can use a boxplot:

```
p + geom_boxplot()
```

By default the quartiles of the data are shown, along with lines 
extending to 90% of the normalized data distribution, with points 
for values outside that 90%. 

A 'violin plot' combines the best of the histogram with the 
boxplot schematic:

```
p + geom_violin()
```

Multiple layers can be added on top of one another:

```
p +
	geom_violin() +
	geom_point()
```

> Do Exercise 3 [Scatterplot]({{ site.baseurl }}/exercises/Scatterplot-R).


### Grouping

* Group on a single graph: are there lake differences?

in the aesthetic argument in a `ggplot` function, a group can
be specified. This can be a color:

```
p <- ggplot(dat, aes(x=algal_sp, y=chlA, col = lake))
p + geom_point()

```

But with lots of lakes, the default color palette doesn't separate 
so well.

or it can be a shape: 

```
p <- ggplot(dat, aes(x=algal_sp, y=chlA, shape = trt))
p + geom_point()

```

or it can be a size:

```
p <- ggplot(dat, aes(x=algal_sp, y=chlA, size = trt))
p + geom_point()

```

Groupings can be mixed or crossed to explore interactions:

```
p <- ggplot(dat, aes(x=algal_sp, y=chlA, shape = trt, col = lake))
p + geom_point()
```

Again, there are too many lakes for this to be meaningful. In
fact some default `ggplot2` behavior attempts to limit the poor
decision making here. 

> Do Exercise 4, [Plotting groups]({{ site.baseurl }}/exercises/Grouping-ggplot-R).

Another way to plot things by lake would be to put all the lakes
on the x-axis, and chlorophyll on the y axis, and use color to 
indicate the richness:

```
p <- ggplot(dat, aes(x = lake, y = chlA, size = algal_sp))
p + geom_point()
```

And finally, using filled bar plots is not advised for showing 
individual observations, but can give an idea of cumulative
totals if those are important:

```
p <- ggplot(dat, aes(x = lake, y = chlA))
p + geom_bar(stat = 'identity')
# IDENTITY is to tell ggplot not to count occurrences but sum them
```

This is marginally more useful when treatments are indicated:

```
p <- ggplot(dat, aes(x = lake, y = chlA, fill = trt))
p + geom_bar(stat = 'identity', position = 'dodge')
```

When using cumulative totals for the same categories across
groups, a fractional approach can be helpful:

```
p <- ggplot(dat, aes(x = lake, y = chlA, fill = trt))
p + geom_bar(stat = 'identity', position = 'stack')

```

### Facet specification

When there is too much information to grasp happening on one plot,
we can take advantage of the `facet_` family of functions:

```
p <- ggplot(dat, aes(x=algal_sp, y=chlA, col = trt))
p + geom_point() + 
  facet_wrap(~lake)

```

> Do Exercise 5, [Faceting]({{ site.baseurl }}/exercises/Faceting-ggplot-R).


The facet plot gives an enormous advantage when data checking.
In one visualization you can see:
* completeness of information by group (i.e., site)
* range of data across grouns
* differences by factor within groups (i.e., treatments)

Facet plots should nearly always encourage you to use a multilevel 
model (i.e. "mixed effects") - but that is a different class.

### Trendlines

The `ggplot` tool is meant to step you from data visualization 
into modeling, though it is *not* a modeling tool. Still, it can
visualize the results of models and relationships. 

In fact, there is a relationship that we used to create the data:

```
p <- ggplot(dat, aes(x = algal_sp, y = chlA))
p + geom_point() + 
   stat_smooth(method = 'lm')

```

### Plotting dates

Dates provide special challenges for the data managing biologist. They are
universally used, easily understandable, and with the
potential to be formatted more ways than can be imagined. 

Dates are horrible to manage. 

Luckily visualizing data arranged by date, or a time series, is one
way to start to diagnose potential problems. 

Some data to play with: 

```
# the seq.Date function generates a sequence of dates
datedat <- data.table(date = seq.Date(as.Date('2018-01-01'), Sys.Date(), by = 1))
# the sin function of the rownumber (.I)
datedat[, y := sin(.I)]
# need a second date column to show ggplot quirks
datedat[, datechar := as.character(date)]

```

The `ggplot` functionality nicely formats dates, but *only* if
they are specified in a particular way:

```
# the two columns *look* identical
datedat[, .(date, datechar)]


p <- ggplot(datedat, aes(x = datechar, y = y ))
p + geom_point()
```

```
p <- ggplot(datedat, aes(x = date, y = y ))
p + geom_point()
```

* Flagging discontinuous time series

Sometimes there is a break in the data that will be important
to know about, and visualizing by day is the fastest way to 
find it:

```
# remove some data and replot:
datedat[sample(1:.N, 3), date := NA]
p <- ggplot(datedat, aes(x = date, y = y ))
p + geom_line()

```

But the `geom_line` function will connect across data observations, 
hiding the break. Another function (`geom_path`) which 
more obviously demonstrates the breaks because it tries to plot
one value for each x.

```
p <- ggplot(datedat, aes(x = date, y = y ))
p + geom_path()

```


### Additional information

* Geometric object
    * [`geom_point()`](http://docs.ggplot2.org/current/geom_point.html)
    * [`geom_line()`](http://docs.ggplot2.org/current/geom_path.html)
* Statistical visualization
    * [`geom_smooth()`](http://docs.ggplot2.org/current/geom_smooth.html)
    * [`geom_bar()`](http://docs.ggplot2.org/current/geom_bar.html)
    * [`geom_histogram()`](http://docs.ggplot2.org/current/geom_histogram.html)
    * [`geom_boxplot()`](http://docs.ggplot2.org/current/geom_boxplot.html)
* Dataset and aesthetic adjustments
    * [`scale_continuous()`](http://docs.ggplot2.org/current/scale_continuous.html)
    * [`scale_manual()`](http://docs.ggplot2.org/current/scale_manual.html)
    * [`lims()`](http://docs.ggplot2.org/current/lims.html)
    * [`labs()`](http://docs.ggplot2.org/current/labs.html)
    * [`guide_legend()`](http://docs.ggplot2.org/current/guide_legend.html)
    * [`theme()`](http://docs.ggplot2.org/current/theme.html), `theme_bw()`, `theme_classic()`
* Grouping related data
    * Same plot
        * Assign grouping variables as default or layer `aes()`
            * `group`
            * `color`
            * `shape`
    * Multiple plots
        * [`facet_grid()`](http://docs.ggplot2.org/current/facet_grid.html)
        * [`facet_wrap()`](http://docs.ggplot2.org/current/facet_wrap.html)

### Saving plots as new files

```
ggsave(“acacia_by_treatment.jpg”)
```

* Lots of optional arguments
    * Location
    * Type
    * Size

```
ggsave(“figures/acacia_by_treatment.pdf”, height = 5, width = 5)
```
