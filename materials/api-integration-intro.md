---
layout: page
element: notes
title: Intro to APIs and data integration
language: R
--- 

### Introduction

> #### Do Exercise 1: [Supplemental Data Discussion]({{ site.baseurl }}/exercises/Supplemental-data-R)

##### Types of supplementary data
* climate
* weather
* species distribution  
* gene annotation 
* biometrics (average biomass, productivity, length, etc) 
* taxonomy 
* ...

##### How to find good sources for this data?
* scientific literature
* governments - federal, state, local
* one-off data search:
	- [DataONE](https://search.dataone.org/#data)
	- [FigShare](https://figshare.com/)
	- [Zenodo](http://about.zenodo.org/)
	- lots of domain-specific places as well...

##### WorldClim

* [Global climate data product](http://worldclim.org/version2)
* [Bioclim variables](http://worldclim.org/bioclim)
	- average for the years 1970-2000
	- good for site characterization
	
> Do Exercise 2: [Worldclim data]({{ site.baseurl}}/exercises/Worldclim-data-R)


* what about the "moving targets" (e.g. taxonomy, weather, streamflow)?

### API Basics

##### **A**pplication **P**rogramming **I**nterface
* Web APIs allow serving of data by connecting databases through 
customizable URL addresses to interactively generate datasets.

* In other words, run a query against a database over the web.
	- But do so *programmatically*, so that you can do inside code!
	
* Example: [HOSTS: Epargyreus](http://www.nhm.ac.uk/our-science/data/hostplants/search/list.dsml?searchPageURL=index.dsml&Familyqtype=starts+with&Family=&PFamilyqtype=starts+with&PFamily=&Genusqtype=starts+with&Genus=Epargyreus&PGenusqtype=starts+with&PGenus=&Speciesqtype=starts+with&Species=&PSpeciesqtype=starts+with&PSpecies=&Country=&sort=Family)
	- URL contains "?" followed by parameters defined by "="
	- in this case, returns a structured web table (show source)
	- you could generate some code to download this table, and parse the data out...
	
... or you could leave it to someone else to do it for you!

[API packages in R]({{ site.baseurl }}/materials/api-R-packages)