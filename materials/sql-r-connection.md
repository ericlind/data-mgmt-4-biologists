---
layout: page
element: notes
title: SQL - R connection
language: SQL, R
---

### Relative strengths
R is very good for statistical analysis and visualization of data,
but sometimes isn't too good at handling large amounts of inter-related data.

Databases like SQL are efficient at storing and managing lots of 
interrelated data, but are not often good at manipulating or
performing math operations on data. 

Why not use the best of both worlds?

#### ODBC connections
An Open Database Connectivity standard or ODBC is used for different
software systems to securely exchange data. Thanks to the community
or R developers, there are many R-flavored ODBC connections
available for pulling from databases into R. 

##### RMariaDB
[MariaDB](https://en.wikipedia.org/wiki/MariaDB) is an
open-source fork of MySQL, meaning the developers who wrote MySQL 
took the open code and built from there following the purchase of 
MySQL by a commercial database company. 

There is an accompanying ODBC package called `RMariaDB` which can 
be used to connect to MySQL from R.

##### Defining a connection
Using ODBC packages, a connection object is first defined in R:

```
library(MariaDB)
con <- dbConnect(RMariaDB::MariaDB(), host = 127.0.0.1, dbname = 'BeeLab',
user = '', password = '', port = 8889)

# Show the tables in the database
dbListTables(con)
```

##### Passing a query to get an R data frame
The command to interface with the database from R consists of 
a connection identity, and some SQL code:

```
dat <- dbGetQuery(con, "SELECT * FROM mn_bees LIMIT 10")
```

This can also be done in stages for bigger tables using combinations
of the `dbSendQuery` and `dbFetch` commands. 