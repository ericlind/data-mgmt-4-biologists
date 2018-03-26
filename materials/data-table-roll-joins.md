---
layout: page
element: notes
title: Roll joins (data.table)
language: R
--- 

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

We can use the Bee database, and some weather data to create 
two timeseries to use:

```
library(RMariaDB)
library(data.table)
library(rnoaa)

con <- dbConnect(RMariaDB::MariaDB(), host = '',  dbname='', user = "", password = '', port=)

colls <- dbReadTable(con, "collection_event")
mytoken <- 'QrKTCPmNwJWXxFhpLHijBfXPIRShBAiv'

out <- ncdc(datasetid='GHCND', 
		stationid='GHCND:USC00218450', 
		datatypeid='PRCP', 
		startdate = '2014-07-01', 
		enddate = '2014-08-30', 
		limit=500, token = mytoken)

str(out)

outdat <- as.data.table(out$data)
colls

# eliminate precip records with no observed precip
prcp <- outdat[value > 0]

```

If our objective is to find the nearest date when there was some precipitation.

One problem that arises *constantly* in data management is 
date type matching. 

```

# have to match date fields...
class(prcp$date)
class(colls$fdate)

prcp$date

# as.Date
?as.Date
as.Date(prcp$date)

?as.POSIXct
as.POSIXct(prcp$date)

strptime(prcp$date, '%Y-%m-%dT%H:%M:%S')

library(lubridate)
ymd_hms(prcp$date)
ymd(prcp$date)

```

Once we have matched formats, we can try to join:

```
# data table: modify inside brackets
prcp[, date := as.Date(date)]
# Base way: assign
# prcp$date <- as.Date(prcp$date)
```

Join or merge without roll - only matches on exact dates in X and Y (inner join)

```
noroll <- prcp[colls, on = .(date = fdate), nomatch = 0]
```

Join with roll: take nearest matching date

```
rolldat <- prcp[colls, on = .(date = fdate), roll = 'nearest']
```

Join with roll: only take nearest PRIOR to survey (LOCF)

```
rolldat2 <- prcp[colls, on = .(date = fdate), roll = T]
colls
prcp
rolldat2

```
