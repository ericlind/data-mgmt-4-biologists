---
layout: page
element: notes
title: Joins
language: SQL
---

### Why use multiple tables

* It is often not efficient to include all information of interest in a single
table.
* Redundant information makes it more difficult to update or revise data.
    * If something changes we want to be able to change it in one place, not
    hundreds of places.
* Use multiple tables
* Each table contains a single kind of information
    * `surveys`: information about individuals
    * `species`: information about species
    * `plots`: information about plots
* If a species name changes we only need to change it in the `species` table
* Connect tables using joins to describe relationships between tables
(*"relational" database*)


### Basic join

* [`JOIN`](http://www.w3schools.com/sql/sql_join.asp) 
    * combine rows from multiple tables
    * based on condition
  
```
SELECT collection_event.site, fdate, treatment, soil
FROM collection_event
JOIN sites ON (collection_event.siteID = sites.siteID)
LIMIT 20
```

* This query selects `site` and `fdate` from the `collection_event` table.
    * The query links the `siteID` from `sites` with `siteID` from `collection_events`.
* `ON` basically works like `WHERE`
    * It represents a matching identifier between two tables
* One way to think about this join is that it adds the information in
  `sites` to the `collection_events` table


* We can also use `USING` as short hand in cases where the column names are the
same across tables.

```
SELECT collection_event.site, fdate, treatment, soil
FROM collection_event
JOIN sites USING (siteID)
LIMIT 20
```

### Compound Joins

* Joins can be made on more than one identifying column. 
As these queries can get a bit long, I like to relabel the tables. 
See the a and b following the tables when first mentioned in the query. 
Then we can use just those letters in the `ON` clause.

```
SELECT * from specimens a
JOIN bee_traits b ON concat(a.genus, a.species) = concat(b.genus, b.species);
```
* Ok this is a really big table. Maybe we want just a few traits. 
Let's do sociality and lecticity.

```
SELECT a.*, b.sociality, b.lecticity 
FROM specimens a
LEFT JOIN bee_traits b on concat(a.genus, a.species) = concat(b.genus, b.species)
```

* the `LEFT JOIN` here indicates that the first table listed after
the `FROM` statement is the anchor table which other tables will join--it
is on the "left," and all of its rows will appear (that meet 
the `WHERE` condition if applicable). Information from other tables 
will be joined if the `ON` condition is met. If not, `NULL` 
values will appear. 

* other types of joins are `INNER JOIN`, `OUTER JOIN`, and `RIGHT JOIN`


### Multi-table join

* Use multiple `JOIN`s to link multiple tables.

```
SELECT genus, species, plant, specimens.site, collection_event.fdate, temp, wind, treatment, soil
FROM specimens
JOIN collection_event USING (colleventID)
LEFT JOIN sites ON (sites.siteID = collection_event.siteID 
AND sites.site = collection_event.site)
LIMIT 50;
```


### Saving queries for future use

* Views save queries to run again.
* Create them by using `Create View` in the `View` menu, or by adding `CREATE
  VIEW *viewname* AS` to the beginning of a query.

```
CREATE OR REPLACE VIEW species_specimen_traits AS
SELECT a.*, b.sociality, b.lecticity 
FROM specimens a
LEFT JOIN bee_traits b on concat(a.genus, a.species) = concat(b.genus, b.species);

```
