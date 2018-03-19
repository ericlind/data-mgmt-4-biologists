---
layout: exercise
topic: APIs & supplemental data
title: Worldclim data
language: R
---

The worldclim dataset can be useful in distinguishing sites in
the recent historic period - the "stationary" means across the 
thirty years from 1970 - 2000.

Install necessary packages
```
# raster package is an R interface to some GIS functionality
install.packages('raster')
library(raster) 

```

Get worldclim data
```
## there are multiple options for worldclim - see ?getData
# for bioclim at highest resolutions, a lat/long is specified

bioclim <- getData("worldclim", var='bio', res=0.5, 
		lon=-93.185, lat=44.985)
bioclim

```
The data downloaded is a set of raster *tiles.* There is one
tile for each of the 19 bioclim variables (see [http://worldclim.org/bioclim](http://worldclim.org/bioclim))

When multiple raster tiles are combined in the same geographic 
location, it can be organized into a raster *stack*.

You can plot the raster values:
```
bioclim[[1]] # the mean annual temperature raster tile
plot(bioclim[[1]])

# add reference lat-long pair
points(x = -93.185, y = 44.985, cex = 2, pch = 16) 

plot(bioclim[[12]]) # mean annual precipitation in mm

# add reference lat-long pair
points(x = -93.185, y = 44.985, cex = 2, pch = 16) 
```

But what you are mostly interested in, are the values themselves 
at your lat-long of interest. The `extract` function in the raster package does that.

```
# make a lat-long data frame
loc <- data.frame(site = 'UMN-StP', 
		longitude = -93.185, latitude = 44.985)

# overlay the lat-long data frame on the entire stack 
extract(bioclim, loc)

```

#### Challenge problem:

1. Connect to the Bee Lab database (your local copy, or the remote hosted one)

2. Create an R table that has the six sites with latitude and longitude:
	
	```
	# where 'con' is your connection definition:
	loc2 <- dbGetQuery(con, 
				"select siteID, longitude, latitude from sites;")

	# because of db field definition (VARCHAR) must turn lat/lon to numeric
	loc2$latitude <- as.numeric(loc2$latitude)
	loc2$longitude <- as.numeric(loc2$longitude)
	```

3. Plot the raster tile for Mean Temperature of the Coldest Quarter 
(refer to bioclim variable list linked above). Add the sites to the map.

4. Which site has the lowest mean temperature of the coldest quarter?

