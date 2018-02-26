---
layout: page
element: notes
title: Create Table
language: SQL
---

Once you have established a database, you may wish to add
new data types or relations as the project expands. 

We will add a new table, `mn_bees`, to the BeeLab database. 

1. Examine the `mn_bees.csv` file located in the repository `ENT5920_DatabaseTutorial`
under /Databases19Feb2018/Data

2. Decide on a data type for the data

column name	 | data type
-------------|-----------
uniqueID	| 	INT
genus		|	VARCHAR(100)
species		| 	VARCHAR(100)
host_family	|	VARCHAR(100)
host_genus	| 	VARCHAR(100)

3. Create empty table structure, including keys and indexes, in MySQL

```
drop table if exists mn_bees;

create TABLE `mn_bees` (
`uniqueID` int(11) NOT NULL AUTO_INCREMENT,
`genus` varchar(100),
`species` varchar(100),
`host_family` varchar(100),
`host_genus` varchar(100),
PRIMARY KEY (uniqueID),
KEY genus (genus)
);

desc mn_bees;
```

4. Import data into MySQL
Alter the statement to reference your path to the local repository

```
LOAD DATA local infile '~/Documents/Projects/ENT5920_DatabaseTutorial/Databases_19Feb2018/Data/mn_bees.csv'
 INTO TABLE mn_bees
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
 LINES TERMINATED BY '\n'
 IGNORE 1 LINES
(uniqueID, genus, species, host_family, host_genus)
;

select * from mn_bees;

```

5. Trick: use **R** to prepare CREATE TABLE statment

You can use the structure of a CSV to create the code you need:

IN R:
```
# from ENT5920_DatabaseTutorial repo

dat <- read.csv('Databases_19Feb2018/Data/mn_bees.csv', stringsAsFactors = F)
head(dat)
str(dat)

output_Create_Table <- function(dat, table_name){
  c1 <- paste0('CREATE TABLE `', table_name, '`(')
  coltab <- data.frame(colname = names(dat), rtype = sapply(dat, class))
  type_lut <- data.frame(rtype = c('integer', 'character', 'factor', 'numeric'),
                         sqltype = c('INT', 'VARCHAR', 'VARCHAR', 'DOUBLE'))
  coltab <- merge(coltab, type_lut, by = 'rtype')
  coltab$maxlength <- apply(dat, 2, function(x) max(nchar(x)))
  c2 <- paste0('`', coltab$colname, '` ', coltab$sqltype, '(', coltab$maxlength, ')', collapse = ', ')
  c3 <- ') ENGINE=InnoDB DEFAULT CHARSET=utf8 ;'
  return(cat(c(c1, c2, c3), sep = '\n'))
}

output_Create_Table(dat, 'mn_bees')
```
