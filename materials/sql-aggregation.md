---
layout: page
element: notes
title: Aggregation
language: SQL
---


### Aggregation

* Aggregation lets us combine rows into groups based on their values and
calculate combined values for each group.

```
SELECT AVG(temp)
FROM collection_event;
```

* Other aggregation functions include `MIN`, `MAX`, `SUM`, and `COUNT`.

```
SELECT MIN(latitude), MAX(latitude), AVG(latitude)
FROM sites;
```

* We can use `GROUP BY` to calculate these values for different groups. 
You can combine `DISTINCT` and `COUNT` to make quick distinct species.
Also, we will rename this column "species_count".

```
SELECT Family, COUNT(DISTINCT(species)) as species_count 
FROM bee_traits 
GROUP BY family
ORDER BY species_count desc;
````

* We can group by multiple columns as well. Now this is getting fun. We can count things in a couple of ways.
Here we can count the number of distinct species in the family Melittidae,
by Genus.

```
SELECT family, genus, COUNT(DISTINCT(species)) AS species_number 
FROM bee_traits 
WHERE family = "Melittidae"
GROUP BY family, genus
ORDER BY genus desc;
```


### Filtering after aggregation

* To filter by an outcome of an aggregation use `HAVING`

```
SELECT Family, COUNT(DISTINCT(species)) as species_count 
FROM bee_traits 
GROUP BY family
HAVING species_count > 3;
```

* This works after aggregation, whereas `WHERE` works before aggregation


### Only use grouped or aggregated fields in `SELECT`

* When using `GROUP BY` only fields that are in the `GROUP BY` clause or
aggregated fields should be used in the `SELECT`
