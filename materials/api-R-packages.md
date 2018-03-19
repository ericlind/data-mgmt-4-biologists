---
layout: page
element: notes
title: API R packages
language: R
--- 

#### Goal: import data using API directly into `R`

##### rOpenSci

* group building R package wrappers to science APIs
* [lots of useful wrappers](https://ropensci.org/packages/)
	
> Do Exercise 3: [Get weather]({{ site.baseurl }}/exercises/Get-weather-R)


##### Exploring other weather APIs
There are an abundance of other options for exploring weather
observations, both raw weather station reports, and modeled
and forecasted weather.

* [Darksky](https://darksky.net/dev/docs)
* [NCEP Reanalysis II](https://www.esrl.noaa.gov/psd/data/gridded/data.ncep.reanalysis2.html)
* [GHCN](https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/global-historical-climatology-network-ghcn)
* [Weather Underground](https://www.wunderground.com/weather/api/)

```
# some weather packages I have used...
install.packages('darksky', 'RNCEP', 'GhcnDaily', 'rwunderground')
```

##### Taxonomy APIs
Taxonomy can be a moving target, yet biodiversity conservation
depends in part on being able to name and identify species in
a consistent way.

This has been controversial recently:
* [Taxonomy anarchy hampers conservation](https://www.nature.com/news/taxonomy-anarchy-hampers-conservation-1.22064)
* [Taxonomy based on science is necessary for global conservation](http://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.2005075)

Because taxonomy changes (though maybe not as frequently as 
the weather), it helps to be able to check your species list
against a standard list. 

[The Plant List](theplantlist.org) is an example for true plants
(including ferns and allies). It is a web API that compiles
the latest up-to-date taxonomic thinking of the major herbaria 
and the specialists in certain clades. 

> Do Exercise 4: [Check taxonomy]({{ site.baseurl }}/exercises/Check-taxonomy-R)

###### Taxize
Another, more broad API wrapper for taxonomy is `taxize` from rOpenSci.
It connects to multiple data sources including animal taxonomy.

```
library(taxize)

###
new.dat$gs <- paste(new.dat$plant_genus,new.dat$plant_species)

# We can do an entire vector
plants2<-as.vector(unique(new.dat[["gs"]]))
classification(plants2, db="itis", row = 1)

# Or simply 1 species at a time
classification("Sander vitreus", db="itis")

#Maybe we just want family
tax_name(query = "Helianthus annuus", get = "family", db = "itis", rows=1)[[3]]

# Get Downstream Data. How many genera are in the perch family?
downstream("Percidae", downto = "Genus", db = "col")

downstream("Percidae", downto = "Species", db = "col", intermediate = TRUE)
```
