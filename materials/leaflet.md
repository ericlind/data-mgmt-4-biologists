---
layout: page
element: notes
title: leaflet
language: R
---

#### Interactive maps in html

Maps are invaluable for environmental data, but sometimes it
seems overwhelming to interact with GIS system or other mapping
environment (google earth, anyone?)

#### [leaflet](https://rstudio.github.io/leaflet/)

`leaflet` builds html maps with interactive features.

There is an R implementation, though leaflet itself is a
commonly used JavaScript library with many native extensions.

#### Install and load library
```
install.packages('leaflet')
library(leaflet)

```

#### basic functionality: `leaflet()`
The leaflet mapping interface works in layers, like `ggplot`, but
with the 'pipe' operator, like `dplyr`:

```
p <- leaflet() %>% 	# call function, can be empty
  addTiles() %>% 	# add basemap, default is open street maps
  setView(lat = 44.963, lng = -93.22, zoom = 14) # options
```

Examine resulting map object, noting:

* opens in Viewer, not in Plot window (html code)
* pans and zooms like regular web map
* can open in browser, save, etc


#### plot data on top of nice basemap
```
# some lat-long data incl translated from DMS
lats <- c(44.974747, (44 + 58/60 + 23/3600), 44.9848671)
lons <- c(-93.235353, -(93 + 14/60 + 40/3600), -93.1824609 ) 

p <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = lons, lat = lats, popup = c('EB', 'WB', 'StP'))

```

Examine resulting map object noting:

* automatic zoom to extent of data
* interactive labels on click

> Do Exercise 4: [Add leaflet to markdown]({{site.baseurl}}/exercises/Leaflet-R)

