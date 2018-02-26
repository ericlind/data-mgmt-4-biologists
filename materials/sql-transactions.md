---
layout: page
element: notes
title: Transactions
language: SQL
---

##### Transactions
In many SQL environments including MySQL, the database can be 
run in a state in which the database itself records all the changes
that are made as you work. This is known as transactional storage,
and can itself be a form of versioning. 

For MySQL:
```
START TRANSACTION;

SELECT * FROM mn_plants 
WHERE genus = 'ACER'
;

# Now make a change to the table
UPDATE mn_plants 
SET code = 'ACNE' 
WHERE genus = 'ACER' and species = 'NEGUNDO'
;

# note change was made
SELECT * FROM mn_plants 
WHERE genus = 'ACER'
;

# whoops! this is not in concordance with USFS code
rollback;

# change is Gone after rollback!
SELECT * FROM mn_plants 
WHERE genus = 'ACER'
;

```

MySQL has a slightly looser form of transactions than many databases - 
it needs to be turned on and used, rather than being automatic - but
you can still "undo" if you know right away you have messed up.

##### MySQL Dump files
It is good practice to export MySQL to the type of human-readable
SQL dump file that we started the class with. 

1. in MySQL Workbench, choose the "Management" tab
2. Choose "Data Export"
3. Select the "BeeLab" schea to export
4. Uncheck any tables you do not wish to include
5. Make sure the selection is for "Dump Structure and Data"
6. Choose destination location
7. Backup, backup, backup...
