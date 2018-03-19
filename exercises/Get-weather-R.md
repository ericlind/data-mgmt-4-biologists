---
layout: exercise
topic: APIs & supplemental data
title: Get weather
language: R
---

Weather is one of the most frequently desired covariates for any 
environmental analysis. The National Oceanic and Atmospheric Administration
has a history of high quality, high frequency, high resolution 
datasets that are available to the public. 

The National Climatic Data Center provides an [API connection](https://www.ncdc.noaa.gov/cdo-web/webservices/v2)
to historical weather. 

The rOpenSci team has created an R package that queries this API
directly, called `rnoaa`. 

1. Get a key from NOAA NCDC - this is necessary to use the API package.
	- go to [https://www.ncdc.noaa.gov/cdo-web/token](https://www.ncdc.noaa.gov/cdo-web/token)
	- enter your email
	- your "token" or key will be sent to you.

2. Install and load the package, and paste your token into an object

```
install.packages('rnoaa')
library(rnoaa)
?rnoaa

mytoken <- 'QrKTCPmNwJWXxFhpLHijBfXPIRShBAiv'
# this is EL's token

```

This part takes a while, so the identifier for the weather station is
provided for you. But if you want to explore available stations,
you can download the whole set (~600K stations, takes a few minutes).

```
#library(data.table)
#station_data <- ghcnd_stations()
#setDT(station_data)
#station_data[latitude > 44.9 & latitude < 45 & longitude > -93.2 & longitude < -93,
             .N, name]
#station_data[name == 'UNIV OF MINN ST PAUL']
```

Once the weather station is identified, you can pull observations:

```
# the weather station USC00218450 is on the St Paul Campus
out <- ncdc(datasetid='GHCND',
 stationid='GHCND:USC00218450',
 datatypeid='TMAX',
 startdate = '2017-03-01',
 enddate = '2017-03-31',
 limit=500, token = mytoken)

out # examine results 
ncdc_plot(out) # built-in plot function (limited but quick)

```

#### Challenge problem:

1. Connect to the Bee Lab database (your local copy, or the remote hosted one)

2. Get the "collection_events" table from the database into an R data frame.

3. Using the St. Paul campus weather station (ID above), download
the precipitation data for the dates inclusive of all the collection 
events.

	>	HINT: use datatypeid = 'PRCP'

4. What was the rainest date during the study period? How much rain
fell (in mm)?

