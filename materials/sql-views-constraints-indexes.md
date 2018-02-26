---
layout: page
element: notes
title: Views, Constraints, and Indexes
language: SQL
---

### Views

A View is a `SELECT` statement that is formalized into an object
that can be called directly with a query. Tables underlying the query
are used to build the resulting table each time it is called, so
any updates to the tables are present in the view. 

It can be beneficial to set up a View for complex or even simple 
`SELECT` statements that you wish to run often. 

Perhaps for the BeeLab dataset, we would like to be able to always
query the latest number of plants that each species has been
associated with. 

First, we can build the appropriate query:

```
SELECT 	concat(genus, ' ', species) AS latin_bee,
		count(DISTINCT plant) AS num_plant_sp
FROM	specimens
GROUP BY latin_bee
;
```

This works, but is a bit awkward to have to reconstruct each time.
We could save the query code and refer to it, but what if we
use this from a new connection? 

Create a View:

```
CREATE VIEW bee_plants AS 
SELECT 	concat(genus, ' ', species) AS latin_bee,
		count(DISTINCT plant) AS num_plant_sp
FROM	specimens
GROUP BY latin_bee
;

# now retrieving this piece of information is easier
SELECT * FROM bee_plants;
```

### Constraints

Using Constraints is a feature of strong database management, in
the sense of using the capabilities of the relational structure to
enforce some rules. Some basic constraints are:

##### `UNIQUE`
This means that for a column (or combination of columns), 
no two rows can have the same values in the table. Often applied to 
sample or specimen identifiers.

```
INSERT INTO specimens
(specimenID, genus, species)
values
(100, 'Apis', 'mellifera')
;

## Error: Duplicate Entry for key PRIMARY
```

The `UNIQUE` constraint can be very helpful when merging new data 
as it prevents repeats or duplicate assignments. 


##### `NOT NULL` 
This constraint means that the row in question cannot be missing 
the information in this column. For instance, a bee specimen cannot
be entered into the specimen table without a collection event. 

##### `FOREIGN KEY`
The relations between tables can be coded "soft", where there
exist relational keys between the tables that are to be linked,
or "hard", where the database is told to recognize the linkage
and thus relate the tables. This can allow stricter data association, 
allow prevention of deletion (or cascading of deletion) and so on.


### Indexes
In the realm of even moderately "big" data, Indexes are what makes 
datasets actually useable. They are one primary function of databases
and the motivation behind many non-database data software.

*Indexes are stored positions on the disk of sorted data*

In MySQL, when searching on an index, the database doesn't have to
"scan" all the rows to find the data matching the `WHERE` statement.
Instead, if references a "map" of the physical data, and selects the
rows which match those records. 

In contrast, when searching on a non-indexed table, the database
will "scan" down the rows of the entire table, evaluating each column
set against the `WHERE` statement. For small datasets, this appears
to be instantaneous. As datasets grow larger, the problem of searching
non-indexed values get more apparent, to where the index structure
of a table becomes the first thing to examine when constructing a query.

You can add indexes to tables once they exist:

```
SELECT * FROM bee_traits WHERE Family = 'Andrenidae';
# 2878 rows | 0.0068 sec

ALTER TABLE bee_traits
ADD INDEX (Family);

SELECT * FROM bee_traits WHERE Family = 'Andrenidae';
# 2878 rows | 0.0041 sec
```
 
