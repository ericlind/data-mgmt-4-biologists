---
layout: page
element: notes
title: MySQL Setup 
language: R
---

We will use a database of bee collections, traits, and associated
plant species that is hosted on Dr. Cariveau's lab computer and accessible
by all students. 

The connection information including location, password, and 
user ID can be obtained by cloning the repository:
[https://github.umn.edu/dcarivea/ENT5920_DatabaseTutorial](https://github.umn.edu/dcarivea/ENT5920_DatabaseTutorial)

Once connected, you will be able to query 9 tables. There are 
7 tables containing data:

```
bee_traits
collection_event
mn_bees
mn_plants
sites
species_specimen_traits
specimens
```

There are also two tables containing metadata:
```
1_metadata_tables
1_metadata_variables
```

These data are stored in a relational database, meaning the information
you may need to aggregate or combine is located in more than one
table. However, the information should also be:

- **indexed**, which makes searching faster
- subject to **constraints**, which prevent erroneous data entry or modification
- **normalized**, which means reduced in form so that data have 
a single representation in the system


Normalization and the process of relationalizing data begin 
with the design of a *schema*. The schema describes the tables 
and columns of a database, as well as the types of data, constraints, 
indexes, and relations among tables including foreign keys. 

> Do [Exercise 1 - Normalize data]({{ site.baseurl }}/exercises/Normalize-NutNet-data/).

Now that you better understand the idea of normalized and 
relational data, it is time to interact with the data in that
format. To do so we use **S**tructured **Q**uery **L**anguage, or SQL
for short. This is a standard syntax for interacting with 
relational database, though it can encode multiple programming
approaches for actually implementing the results in different
database systems.

