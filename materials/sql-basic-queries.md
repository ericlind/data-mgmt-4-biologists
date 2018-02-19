---
layout: page
element: notes
title: Basic Queries
language: SQL
---

#### n.b. to connect to the database used in the examples below you should clone [the example repository](https://github.umn.edu/dcarivea/ENT5920_DatabaseTutorial)

### Database Queries

* Data is separate from manipulations of the data
* Tables - store the data
* Queries - store questions about the data
    * If we update the data, the query asks the same question of the new data.

### Style

* SQL generally doesn't care about capitalization or line breaks. So it will run
a query like this.

```
seLEcT FDate, TEMP, weather, wiNd FrOm coLLection_EVENt wheRe temP > 30 aND site = 'DM';
```

* This is difficult to read so we follow style rules for writing SQL code
    * Capitalize SQL commands
    * Lowercase variable names
	* One clause/line
* SQL queries typically end with a `;` though it is not always necessary 
depending on the client application.

### Selecting columns

* Choose which columns to return.

```
SELECT siteID, treatment, soil
FROM sites;
```

* They can occur in any order.

```
SELECT treatment, soil, siteID
FROM sites;
```

* If we want to get all of the columns we can use `*`, which is a wildcard that
means "all".

```
SELECT *
FROM specimens;
```

* For unique values use `DISTINCT`.

```
SELECT DISTINCT Family, Genus 
FROM bee_traits;

```

* We can also do calculations in the `SELECT`.

```
SELECT siteID, latitude/100
FROM sites;
```

* We can also use functions.

```
SELECT siteID, ROUND(latitude, 2)
FROM sites;
```

* Sometimes you just want to know how big the table is. Use `COUNT`:
```
SELECT COUNT(*)
FROM bee_traits;
```

* Whoa that table has a lot of rows. We can just take a peak by
telling SQL to `LIMIT` the number returned:
```
SELECT *
FROM bee_traits
LIMIT 10;
```


### Filtering

* Use `WHERE` to select only the rows meeting certain criteria.
    * Follow `WHERE` with a conditional statement
        * General form: column, condition, value
        
        `=`       | equals
        `>`  `<`  | greater / less than
        `>=` `<=` | greater / less than or equal to
        `!=` `<>` | not equals (`!=` *consistent with other languages*)

```
SELECT Family, Genus 
FROM bee_traits 
WHERE family = "Apidae" or family = "Andrenidae";
```

```
SELECT siteID
FROM sites
WHERE latitude >= 45;
```

* To combine two or more conditions use `AND` and `OR`.

```
SELECT fdate, weather, temp, wind
FROM collection_events
WHERE site = 'HI' AND temp > 25;
```

* Sometimes there are NULL values. We can use `WHERE` to remove them by asking SQL to only
  give us non-NULL values.

```
SELECT genus, species, subspecies
FROM bee_traits
WHERE subspecies IS NOT NULL;
```

* If you want only NULL values, use `IS NULL` instead

