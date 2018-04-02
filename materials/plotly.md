---
layout: page
element: notes
title: plotly
language: R
---

#### Interactive visualizations
Static plots allow full control over display, but intuition 
and understanding are built through interaction. 

This can be just as true for your data management tasks as it
can be for representing results of analyses.

#### [plotly](https://plot.ly/)
Commercial data visualization company, integrating _d3_ code
with python and R.

`plotly` builds html widgets that can be stand-alone websites,
or be embedded into other tools (R-markdown, shiny).

#### Install and load library
```
install.packages('plotly')
library(plotly)

```

#### basic functionality: `ggplotly()`
```
library(ggplot2)

# re-use toy lakes dataset
source('create-sim-lake-data.R')

# basic plot
p <- ggplot(dat, aes(x = lake, y = chlA))
p + geom_boxplot()

# invoke plotly simply by single function - default is to 
display the last ggplot object
ggplotly()

```

Examine resulting plotly object, noting:

* opens in Viewer window (html code)
* hovering displays values
* can open in browser (it is standalone html)
* can capture a screenshot (png file)

#### interactive filtering and zooming
```
p <- ggplot(dat, aes(x = algal_sp, y = chlA, col = lake)) + 
		geom_point()
ggplotly()

```

Examine resulting plotly object noting:

* ability to _filter_ by clicking on the legend
	- click individual values on/off
	- double-click to isolate values
* ability to zoom using interactive buttons


> Do Exercise 3: [Add plotly to R-markdown]({{site.baseurl}}/exercises/Plotly-R)

#### native interactive plot function `plot_ly()`

```
plot_ly(x = dat$algal_sp, y = dat$chlA, 
		type = 'scatter', mode = 'markers', 
        color = dat$lake)
```

The `plot_ly()` function encodes many of the idealized design
features of good visualizations, but can be more flexible than 
the `ggplot()` framework. 

See the [plot_ly in R cheatsheet](https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf)

