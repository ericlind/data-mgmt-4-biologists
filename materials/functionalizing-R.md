---
layout: page
element: notes
title: Functionalizing R
language: R
---

### Functions

- Defining a function:

		is_positive <- function(integer_value){
			if(integer_value > 0){
			   TRUE
			else{
			   FALSE
			{
		}

In R, the last executed line of a function is automatically returned, otherwise use `return()` to be sure you know what the function is giving back to you.

- Specifying a default value for a function argument

		increment_me <- function(value_to_increment, value_to_increment_by = 1){
			value_to_increment + value_to_increment_by
		}

`increment_me(4)`, will return 5

`increment_me(4, 6)`, will return 10

- Call a function by using `function_name(function_arguments)`

- apply family of functions: `apply()`,	`sapply()`, `lapply()`,	`mapply()`
   `apply(dat, MARGIN = 2, mean)` will return the average (`mean`) 
   of each column in `dat`

### Sourcing

Once you have created a useful function, you can access it 
readily by storing it in its own script, with nothing but
the code to define the function. Then the script can be called
from any other script where you need the function:

`source('scripts/fxnscript.R')`

If configured properly, this will load the function into your
environment, so that it is ready to call.

n.b. once you have a few of these scripts building up, you will
be well on your way to creating your own package...

> Do [Exercise 3 - Create function]({{ site.baseurl }}/exercises/Create-function-R/).
