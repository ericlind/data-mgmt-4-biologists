---
layout: page
element: notes
title: Metadata Intro
language: R
---

# Metadata IS data
contains fields with values

# Metadata IS NOT data
at least not the data you are interested in. It _describes_ the data that will be
of interest, but does not represent or contain that data.

## Data ‘reporting’
	
- WHO created the data?
- WHAT is the content of the data?
- WHEN were the data created?
- WHERE is it geographically?
- HOW were the data developed?
- WHY were the data developed?

## Who uses Metadata?
- you!
	- discovery of past projects
	- filtering (date, location, etc of datasets)
- Somebody else
	- meta-analysis (_data citation_)
		- This is the future currency in academia, and has been for some time...
	- web aggregators / engines ('the semantic web')
	- future scientists

## You may be required to create metadata
- submission to archives
- submission to journals


Examples of applicable journal data submission statements

[Nature](https://www.nature.com/authors/policies/data/data-availability-statements-data-citations.pdf)

[AGU](https://publications.agu.org/author-resource-center/publication-policies/data-policy/)

[BMC Biology](https://bmcbiol.biomedcentral.com/submission-guidelines/preparing-your-manuscript/research-article)

[Biological Conservation](https://www.elsevier.com/journals/biological-conservation/0006-3207/guide-for-authors#87500)

		
Only slight difference between descriptive metadata and proscriptive metadata
where the latter is required format to fit into some database or data sharing scheme

e.g. camera trapping metadata standard

## General Metadata contents

#### Identification Information
- People
- project identifiers

#### Purpose
- original collection motivation
- associated papers or methods

#### Dates, times, and locations 
- _where_ and _when_ are fundamental to utility of all data 
- details vary based on data type
	- GIS: specific formatting for geospatial representation
	- weather data: date, time format important

#### Data dictionary
- table by table, column by column
- for each vector or element of information:
	- what is it called?
	- what is its type?
		- character (length? allowable values?)
		- numeric (integers? precision? decimal place limit?)
		- logical
		- null?
	- what is its description?
	
#### Constraints, Liabilities, and Citation instructions. 
- What if any are the limits on use of the data?
- What responsibility do the named people in the metadata document have for the underlying data?
- How should users cite this data package?


## Metadata Schema Examples

[Darwin Core](http://rs.tdwg.org/dwc/)

- [Example of "simple" Darwin Core](http://rs.tdwg.org/dwc/xsd/tdwg_dwc_simple.xsd)

[EML](https://knb.ecoinformatics.org/#external//emlparser/docs/index.html)
  - strong typing of allowable fields
  - [example](https://knb.ecoinformatics.org/emlparser/eml-sample.xml)
  - [Morpho](https://knb.ecoinformatics.org/#tools/morpho)
      * 110 page user guide

XML and EML are "human-readable" but only in the technical sense

[USFS FIA metadata](https://www.fia.fs.fed.us/library/database-documentation/current/ver60/FIADB%20User%20Guide%20P3_6-0-1_final.pdf)

[An open standard for camera trap data](https://bdj.pensoft.net/article/10197/element/5/3500059/)

- Hierarchical nesting of images (within sequence) within deployment within project
- allows standardization of data storage & sharing
- using XML or JSON template allows data to fit into API web publishing

[MN Geographic Metadata guidelines](http://www.mngeo.state.mn.us/committee/standards/mgmg/metadata.htm)

[Ad-hoc, institutionally consistent formats]({{ site.baseurl }}/data/e141_Soil_nitrogen.txt)




