---
layout: exercise
topic: Metadata
title: Homework1
language: R
---
# Clean & Document dataset

**Homework should be committed to your _github.umn.edu_ repository by 4:30 Monday Feb 19.**

You will work in the named repository (ENT5920-Lastname) you created in Week 3.

Using a dataset of your own, preferably one you will be using in your
research, *clean* and *document* the data as follows:

1. Choose a limited dataset, 5 - 10 columns of data. Number of
rows is less important except as it impedes your ability to post 
the data to github.

2. Create an R script which does the following:
	- reads the data in, using relativized (not hard coded) paths
	- gives a summary table of the number of *identifiers*
		- places, dates, species if applicable
	- produces numerical summaries of *variables*
		- ranges, central tendencies, quartiles
		- histograms of values
		- correlation among variables
	- cleans any errors found, preferably with generic function
	- outputs a clean dataset to a new location with datestamp
	
3. Create a metadata record for this dataset. The format of 
the metadata document should follow a standard for your
field, if possible. If not, associate the metadata with 
the data by adding it to the header of the data document. The metadata record
should include:
	- The project, and investigator(s) responsible for the data
	- The geographic and temporal restriction of the data
	- a short (1 paragraph) abstract of the purpose & methods
	- a data dictionary with column definitions

4. Commit the data, QC script, and metadata documents to your 
local git repository.

5. Push the changes to your remote (github.umn.edu) repository.

6. Ensure both Dan (dcarivea) and Eric (elind) are added as collaborators
to your repository.