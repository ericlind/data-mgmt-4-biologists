---
layout: page
title: Syllabus
catalog: ENT 5924
credits: 2
semester: Spring 2018
professor: Eric Lind & Dan Cariveau
office: Bee Lab
email: elind@umn.edu
phone: 612-624-1254
schedule: ['Mondays, 4:30-6:30, McNeal Hall 395']
---

## {{ site.title }} 

{{ page.catalog }}, {{ page.credits }} Credits, {{ page.semester }}

### Professor

{{ page.professor }}

Office: {{ page.office }}

Email (best way to contact us):
[{{ page.email }}](mailto:{{ page.email }}), [dcarivea@umn.edu](mailto:dcarivea@umn.edu)

Phone: {{ page.phone }}


### Times & Location

{% for class in page.schedule %}
  {{ class }}
{% endfor %}


### Office Hours

By appointment. *Note: Schedules are busy and EL is not on campus so
please try to schedule appointments as far in advance as possible. In general it
will be very difficult to set up appointments less than 24 hours in advance.*


### Website

The syllabus and other relevant class information and resources will be posted
at [{{ site.url}}]({{ site.baseurl }}/).
Changes to the schedule will be posted to this site so please try to check it
periodically for updates.


### Course Communications

Email: [{{ page.email }}](mailto:{{ page.email }})


### Required Texts

There is no required text book for this class.


### Course Description
 
This course is focused on providing hands-on experience in organizing, managing,
curating, and accessing data. It is conceived as a topic-drived weekly seminar (12 sessions at ~2h each),
combining small amounts of lecture with problem solving and hands-on exercises.
Students will encounter the data life cycle from generation to preservation.


### Prerequisite Knowledge and Skills

No prerequisites are required. However, we strongly recommend that students have
basic experience in a scripting or coding environment (e.g., R, SAS, Python,
SQL etc) or experience with a command line shell (CMD, Linux). Most of 
the course will be taught using [R](http://www.r-project.org) in [R Studio](http://www.rstudio.com).

### Course Technology

Students are required to provide their own laptops and to install free and open
source software on those laptops (see [Setup]({{ site.baseurl }}/computer-setup)
for installation instructions). Support will be provided by the instructor in
the installation of required software. If you don't have access to a laptop
please contact the instructor and they will do their best to provide you with
one.

### Purpose of Course

Biology graduate students are typically trained in depth in the theory and practice of their 
chosen specialty, from developing questions to designing experiments 
and data collection, to analyzing the resulting data using a variety of 
statistical tools. The exception to this is *data management*--that is,
what happens to the data once collected, before and after it is turned into
analyses and made into publications. 

The purpose of this course is to confront the problems and offer
solutions for this "hidden" part of the data life cycle, and to fill 
this training gap.

### Course Goals and Objectives

Students completing this course will be able to:

* Articulate _why_ and _how_ to think systematically about 
data management, as distinct from (but complementary to) data
collection and statistical analysis
* Develop computing and coding skills for exploring, managing, and
finding data sources
* Create well structured databases
* Extract information from databases
* Write simple computer programs in R
* Automate data analysis
* Apply these tools to address biological questions
* Create a data management plan for their own data

### Assessment

Students will complete three homework assignments:
* cleaning and documenting a dataset using data manipulation and visualization techniques
* developing a database with appropriate metadata
* writing a data management plan suitable for submission with a grant proposal

Get more details about the assignments from the [assignments page]({{ site.baseurl}}/assignments).

### Instructional Methods

Students will be provided with reading material that they are expected to 
read prior to class. Classes will
involve brief refreshers on new concepts followed by working on exercises in
class that cover that concept. While students are working on exercises the
instructor will actively engage with students to help them understand material
they find confusing, explain misunderstandings and help identify mistakes that
are preventing students from completing the exercises, and discuss novel
applications and alternative approaches to the data analysis challenges students
are attempting to solve. For more challenging topics class may start with 20-30
minute demonstrations on the concepts followed by time to work on exercises.

## Course Policies


### Grading Policy

As a graduate seminar the credits will be earned on a pass basis.
This requires regular attendance to the 12 weeks of class and submission of the
required assignments with evidence of appropriate effort.

### Assignment policy

Assignments are due on the specified date by 11:59 pm Central Time. Assignments should be
submitted via Canvas.


## Course Schedule

The details course schedule is available on the course website at:
[{{ site.url }}/schedule]({{ site.baseurl }}/schedule).


**Disclaimer:** This syllabus represents our current plans and objectives. As we
go through the semester, those plans may need to change to enhance the class
learning opportunity. Such changes, communicated clearly, are not unusual and
should be expected.
