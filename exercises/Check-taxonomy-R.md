---
layout: exercise
topic: APIs & supplemental data
title: Check taxonomy
language: R
---

The Plant List has a web API with an accompanying R package:
`Taxonstand`. We will use the API to check a list of plant
names for accuracy and synonomy.

First, get necessary packages: 

```
install.packages('Taxonstand')
library(Taxonstand)
library(tidyverse)
library(RMariaDB) 
```

We will use the `specimens` table from the Bee Lab dataset:
```
# make your connection to local or remote db as 'con'
specimens <- dbReadTable(con, "specimens")

### Small Table so we can disconnect
##
dbDisconnect(con)
```

Creating a "genus-species" column helps with merging

```
specimens$gs <- paste(specimens$plant.genus, specimens$plant.species)
```

Now we get unique values for plant names in this dataset. 
What are some potential problems that you see here?

```
plants<-unique(specimens[c("plant.genus", "plant.species")])
plants
```

Now we can get data from The Plant List. The 'TPL' function 
does this. Note that it can take awhile with a lot of names...

```
sp.out <- as.data.frame(TPL(genus=plants$plant.genus, species=plants$plant.species))
sp.out
```

first let's find things that do not match

```
out1<-filter(sp.out, Plant.Name.Index==FALSE) %>% select(Taxon, New.Genus, New.Species)
out1
```

We can update plant names. 
```
out1$New.Genus <- ifelse(out1$New.Genus == "common", "Helianthus","null")
out1$New.Species <- ifelse(out1$New.Species == "sunflower", "annuus","null")
```

Now we have a data frame with Taxon (old name) and upated new names
We want to keep this old name for joining with our data set at the end.


We can also look for typos

```
out2<-filter(sp.out, Typo==TRUE)%>% select(Taxon, New.Genus, New.Species)
out2
```

#### Challenge problem:

1. Find any synonyms returned from the Plant List for the specimen names.

2. Join the original specimens table to the Plant List taxonomy.

3. How many bees were observed on Compositae flowers?

