---
layout: exercise
topic: Workflow with git and R Studio
title: Create script
language: R
---
Being an open-source product, R requires occasional intervention
by you as a user to make sure your software is up to date. 

When upgrading to a new major release (e.g. R 3.3 to 3.4), 
the packages you have installed should be re-installed to get the
latest compatible versions (and sometimes even for them to work).
With some bundles of packages this is straightforward, but you 
will almost certainly need to download, install, and use packages
from a variety of sources in your work. 

Here, you will create a utility script which you can call when 
you upgrade your R version, to download and install clean versions 
of your most common packages.

1. Create a new R script and save it with a useful name related to its purpose. 

2. Using comments, give the purpose of the script and what it 
ought to return when it works correctly. 

3. Write the code that will install all three of the packages you 
just installed in the [install packages]({{ site.baseurl }}/exercises/Install-packages-R) exercise. 
