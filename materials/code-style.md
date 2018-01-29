---
layout: page
element: notes
title: Comments & Code style
language: R
---
\# <- this is called a 'Pound'
...although some people call it a 'hash.'

It was a nifty advance of push-button telephones over rotary phones (ask an old person like EL).

You probably have seen it used in to label things ('hashtag')...
... and that is what we are doing here--it is not part of the code, but a comment upon the code!

#### Annotating code 

Annotating or "commenting" is for:
* future you (information entropy!)
* sharing with anybody else 

Well-annotated code is the single best way to keep learning in R, 
and for you to be able to share your work with others.

```
# comments can come above a line of code
citation() ## or after a bit of code, on the same line

# R studio can auto-comment and un-comment lines of code
# citation()
```

#### Spacing, margins, and commas
R is not a language in which white space is meaningful, so the
use of white space only impacts human readability. However, this
is very important!
 
While to some degree spacing and syntax are personal, there are
some general suggestions to keep code readable:  

* Use the margins option in RStudio to see where a linebreak would typically be.
Use return to wrap code so it is visible in a window of typical width.

* Follow commas, assignment arrows, and math operations with a single
space: ```round(pi, 2)``` is easier to read than ```round(pi,2)```
* use line spaces in your script to separate chunks
* use section breaks to gather and collapse blocks

R studio has a nice hotkey/menu item to insert breaks of code 
`Shift`-`Cmd`-R

#### Functions

```
# functions ------------------------------------------------
mean() # functions are commands / expressions with: 
  	# a defined name
	# (optionally) input parameters called "arguments"
  	# defined output, (optionally) based on the arguments

# tab completion to learn more about arguments
round()
```

#### Interfacing with the file environment
R is able to read, and using some special functions, to alter, 
the file environment. RStudio likewise can create new directories, 
change filenames, move things around and delete files. 

```
## Where am I?
list.files()  ### lists all files in working directory
```
#### Using Project files and relative file paths
The `.Rproj` file type is an R "Project." It contains the location 
and references of the files you are using, and can coordinate the data,
the code, and the folder structure for your particular working directory.

The biggest advantage of using the R Project is the ability to *ignore*
the higher file structure of a particlar working location on the disk,
and to use *relative* file paths. 

This is especially helpful when working on a single code and dataset
across multiple computers, and multiple users. 

#### Getting help on things
```
?function_name
# or
help(function_name)
# or
??keyword

# see difference between
?mean
# and
??mean

# Using the examples in the help
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))
```
> Do [Exercise 2 - Create script]({{ site.baseurl }}/exercises/Create-script-R)


### External code style guides: 
- [Hadley Wickham / tidyverse](http://r-pkgs.had.co.nz/style.html)
- [Google](https://google.github.io/styleguide/Rguide.xml)
