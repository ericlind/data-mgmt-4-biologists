---
layout: exercise
topic: Workflow with git and R Studio
title: Create function
language: R
---

##### **Don't Repeat Yourself**

If you will be performing actions more than once it is better to 
create modular code that does the task. The alternative, copy-pasting
code and modifying it for the new target, is an error-generating
process. It also contains a large inefficiency: when you want to 
change something about what the code does, you must change it 
as many times as you have repeated the statement. 

In contrast, a modular piece of code need only be changed once, and
in one place, then re-run against the targets. 
In `R`, one option for modular code is to create a custom function. 
Functions take arguments, and return results, but other than that
have nearly unlimited flexibility. 

1. `R` has some quirks. One is that despite being written 
primarily as a statistical software language, it does not come 
with a built-in function to calculate the [standard error of the mean of a sample](https://en.wikipedia.org/wiki/Standard_error).
This is a very useful property to calculate in many descriptive statistical 
summaries. 

2. Create a new script and save it with a useful name that indicates 
it contains a function for calculating the SEM.

3. Using comments, document what the function is meant to do,
what inputs it uses, and what it is expected to return. 

4. The definition of the standard error of the mean is: the standard deviation
of the observations, divided by the square root of the number of observations. 
	* the function for calculating standard deviation is `sd()`
	* the function for taking the square root is `sqrt()`
	* the function for calculating the number of elements in a vector is `length()`

5. Write a function which takes as its arguments a vector of numbers `x`
and returns the standard error of the mean of those numbers. Name the 
function `se_m`.

6. Open a *separate script*. Make `se_m()`
available in the environment by using the `source()` function and
the name of the function definition script you created. 

7. Calculate the standard error of the mean for the sequence of numbers 1:20. 

**Optional**: modify your function to operate even when a vector
of numbers includes an NA value.