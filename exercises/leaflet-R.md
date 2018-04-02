---
layout: exercise
topic: ggplot2
title: Add leaflet to R-markdown
language: R
---

Using the R-markdown document you have built, add a new 
code chunk to output a map using `leaflet`. 

1. connect to the BeeLab database, through a connection we
have used in prior labs.
2. Get the latitude and longitude coordinates from the `sites`
table in the BeeLab database.
3. plot the sites as circles on the basemap you choose, using 
the `addCircleMarkers` function.
