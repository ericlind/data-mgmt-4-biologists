---
layout: page
element: notes
title: Introduction to R
language: R
---

> Remind students to install R and RStudio.

> Have students open RStudio and check to see if console "sees" R.

### R

* Programming language
* Statistics and data analysis environment


### RStudio

* IDE - Integrated Development Environment
    * Interpreter/Console
    * Text editor
        * object highlighting 
        * information about problems with code
        * `tab` key autocompletes
            * Let the computer do repetitious work. 
            * It's easier and with fewer mistakes.
    * Environment/History
    * Project management
    * Options/Preferences (Tomorrow Night 80s)

### Basic operations
* cmd-Enter / Ctrl -R
* option- - / <-
* functions: ()

### Functions

* A function is basically a complicated expression. It is a command that returns
  a value, but hides the details of how that value is determined. This is useful
  because we typically don't want to look at the details of how numbers are
  rounded or lists of numbers are sorted.

```
abs(-2)
```

* A function call is composed of two parts, the name of the function and the
  arguments that the function requires to calculate the value it returns. In the
  example above `abs()` is the name of the function, and `-2` is the argument.

* Functions can take multiple arguments. For example, if we want to round `pi` to
  two decimal places we would use the round function with the arguments `3.14159`
  and `2`, where the first argument is the number to be rounded and the second
  argument is the number of decimal points to round it to.

```
round(3.14159, 2)
```

* Save the output of a function by assigning it to a variable

```
pi_approx <- round(3.14159, 2)
pi_approx
```

### installing & loading packages
* packages are collections of specialized functions and other code
* installing from RStudio menus
* installing from command line
* installing versus making active in environment
* `library()` v `require()`

> Do [Exercise 1 - Install packages]({{ site.baseurl }}/exercises/Install-packages-R/)



