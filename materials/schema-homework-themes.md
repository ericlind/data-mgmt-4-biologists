---
layout: page
element: notes
title: Schema homework review
language: SQL
---

# Schema assignment commonalities

### Foreign key / lookup table concept: need two components in a  LUT: 
1. reference
2. value
	
### overall "key-value" pair idea

### Star schema: fact & dimension

### intersection tables

### stored statistics versus calculated statistics

### column names formats:
* kebab-case
* Train-Case
* camelCase
* snake_case

### dimensionality: things, places, routes, times	
* what is the lowest level of identifier
that you can use for a particular piece of data?
* associating scale with measurement


### meaningful keys (human readable) versus numeric relations
* numbers sort quickly and without ambiguity (e.g. dashes)


### going "LONG"
Duck_Survey_ID (PK)  
Vegetation_Survey_ID (FK)  
Species  
Lone Pair (INT)  
lone male (INT)  
lone female (INT)  
grouped pair (INT)  


to 

Duck_Survey_ID (PK)  
Vegetation_Survey_ID (FK)  
Species  
Type (Lone Pair, lone male, lone female etc)  
Number  
