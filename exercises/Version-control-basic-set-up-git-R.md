---
layout: exercise
topic: Version Control Basic
title: Set Up Git
language: R
---

The University of Minnesota hosts an [internal Github site](https://github.umn.edu). 
This site allows both private (only you and those you choose can see) 
and "public" (all those with a github.umn.edu account can see) repositories. 

To complete the following exercise, you must:
* Have git installed for your operating system following the
[setup instructions](http://www.datacarpentry.org/semester-biology/computer-setup/).
* Create an account on github.umn.edu using your UMN login information.


Create a new repository at github.umn.edu:

1. Navigate to [github.umn.edu](https://github.umn.edu) in a web browser and login.
2. Click the `+` at the upper right corner of the page and choose `New repository`.
4. Fill in a `Repository name` that follows the form `Lastname-ENT5920`.
5. Select `Private`.
6. Select `Initialize this repository with a README`.
7. Click `Create Repository`.

Next, clone your new repository and set up a project in RStudio:

1. File -> New Project -> Version Control -> Git
2. Navigate to your new Git repo -> Click the `Clone or download` button ->
   Click the `Copy to clipboard` button.
3. Paste this in `Repository URL:`. 
4. Leave `Project directory name:` blank; automatically given repo name. 
5. Choose where to `Create project as subdirectory of:`.
6. Click `Create Project`.
7. Check to make sure you have a `Git` tab in the upper right window.
