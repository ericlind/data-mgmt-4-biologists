---
layout: exercise
topic: Introduction to R
title: Install packages
language: R
---
The existence of packages written specifically for performing 
certain tasks is one of the things that makes R such a great
scripting platform for data management, analysis, and visualization. 

There are recommendations of packages which contain functions
built especially for lots of commonly used research areas of biological computing, 
such as [analyzing spatial data](https://cran.r-project.org/web/views/Spatial.html), 
[ecological and environmental analysis](https://cran.r-project.org/web/views/Environmetrics.html), 
and [genetics](https://cran.r-project.org/web/views/Genetics.html). 

Some packages are interrelated with others, and share common style
and language--the [tidyverse](https://www.tidyverse.org/) is one well-known example
for data management and statistics ("data science").

The [CRAN](https://cran.r-project.org/web/packages/index.html) (Comprehensive R Archive Network)
contains versions of packages which are tested and known to work on 
all systems and under the specified versions of R. 
Other package contributors who want to share their work without 
undergoing CRAN review will offer them elsewhere online (e.g. at [GitHub](https://github.com)).

We will be exploring different approaches to managing and visualizing 
data in R. These are some of the packages which will be the work horses
of our methods. 

1. Install the packages "ggplot2" and "RMariaDB" using the `Install`
button on the "Packages" tab of the RStudio panel. As the installation
proceeds, watch the Console for the function call and response.

2. Using what you observed in the console, install the package 
"data.table" from the command line (console or script window).

3. Make all three packages active in the environment.

4. Display the help for the function `fread` in the "data.table" package.