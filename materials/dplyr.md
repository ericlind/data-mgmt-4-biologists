---
layout: page
element: notes
title: Intro to dplyr
language: R
--- 

## Data Manipulation in R

>We will use the connection to the BeeLab dataset hosted on your local machine
for these exercises:
>
> 1. Start MAMP - ensure it is running
> 2. Open the R Studio project file you have associated with your local repo
> of [ENT5920_DatabaseTutorial](https://github.umn.edu/dcarivea/ENT5920_DatabaseTutorial)
> 3. Before beginning, `pull` to get the latest version of any shared code.



### Basic `dplyr`

* Modern data manipulation library for R
* Does a lot of the same things we've learned to do in SQL.

##### Pull in data
```
bee_traits <- dbReadTable(con, "bee_traits")

library(dplyr)
library(data.table)

dat <- setDT(bee_traits)
df <- data.frame(bee_traits)
class(dat); class(df)

```

* Select: 
    * `select(df, Family, genus, species, Parasitic)`
* Filter:   
	* `filter(df, Family == 'Andrenidae')`
	* `filter(df, n_Lat > 0)`
	* `filter(df, n_Lat > 0, Family == 'Andrenidae')`

* Mutate: 
    * `mutate(df, FamCode2 = substr(Family, 1, 4))`

> Do [Exercise 2 - Bee Trait Data Basics]({{ site.baseurl }}/exercises/Dplyr-bee-trait-data-basics-R).

### Aggregation

* Group by: 
    * `group_by(df, Family)`
    * Different looking kind of `data.frame` 
        * Source, grouping, and data type information

```
Famdf <- group_by(df, Family)
```

* Grouping with `summarize()`:
    * `summarize(Famdf, num_species = length(species))`

> Do [Exercise 3 - Bee Trait Aggregate]({{ site.baseurl }}/exercises/Dplyr-bee-trait-aggregation-R).

### Joins

* `inner_join` in `dplyr` works like `JOIN` in SQL

```
specimens <- dbReadTable(con, "specimens")
combined <- inner_join(specimens, df, by = c('genus', 'species'))
head(combined)
```

> Do [Exercise 4 - Bee Table Merge]({{ site.baseurl }}/exercises/Dplyr-Bee-data-join-R).

### Pipes

* Combine a series of data manipulation actions
* Intermediate variables
    * Step-wise approach 
    * Can get cumbersome with lots of variable objects in the environment

```
parasiticBees <- filter(df, Parasitic == 'Yes')
parasiticBees_byFam <- group_by(parasiticBees, Family)
parasitic_avg_emerge_byFam <- summarize(parasiticBees_byFam, 
                                 avg_emerge = mean(Pheno_mean, na.rm=TRUE))
parasitic_avg_emerge_byFam
```

* Pipes:
    * Operator: 
        * `%>%`
    * Operation:
        * `%>%` takes the output of one command and passes it as input to the next command 
        * `x %>% f(y)` translates to `f(x, y)`
        * `surveys %>% filter(species_id == "DS")`

```
df %>% # Command-Shift-M is the shortcut to insert a pipe %>% 
  filter(Parasitic == 'Yes') %>% 
  group_by(Family) %>% 
  summarize(avg_emerge = mean(Pheno_mean, na.rm = TRUE))
```

> Do [Exercise 5 - Bee Piping]({{ site.baseurl }}/exercises/Dplyr-piping-R).
