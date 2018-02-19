---
layout: page
title: Computer Setup
---

### SQL

For this course, we will be creating a MySQL database. 
This will involve two parts. First, you will need to turn your computer into a server.
This will allow you to store and access local files. Others will
be able to access your computer remotely but that is for later. 

Second, we will connect to the server using two different interfaces. 
A MySQL client (e.g. Sequel Pro, HeidiSQL or SQLWorkbench) as well as R. 

#### Installing your server

First, we will need to install a server. MAMP is a simple, free and powerful software bundle for running a server. MAMP stands for **M**y **A**pache - **M**ySQL - **P**HP. 

Download MAMP at https://www.mamp.info/en/
	
#### Install and start MAMP

Install MAMP by opening the file. Note that MAMP PRO is a paid version therefore be sure to uncheck boxes that request you download the pro version. Installation could take a few minutes.

Once installation is complete, open MAMP. Two little green dots next to Apache Server and MySQL Server should show up indicating that it is working. It may also open the MAMP website automatically.

You might need to reonfigure ports and we will do so here so that everyone is on the same page and code is consistent. To do this, simply click on "Preferences". Change Apache to 8888 and MySQL to 8889.

#### MySQL Client

There are a number of clients that allow you to interface with MySQL. As a Mac user I prefer Sequel Pro (https://www.sequelpro.com/) and HeidiSQL works well for PC (https://www.heidisql.com/). Another is MySQL Workbench (https://www.mysql.com/products/workbench/).

Download, install and open one of these clients. After installing and starting the new client, you will be prompted to start a new session. You can name and save your session (e.g. Cariveau_Local). 

You will need to enter in some information to start

Prompt        | To Enter
------------- |----------
Host/IP type  | 127.0.0.1
User          |  root
Password      |  root
Port          |  8889 (if you used 8889 as noted above. You can check you MAMP port via preferences in MAMP)

Once you have done this, you have successfully created a MySQL server and connected it via a local client! This will allow you to access your database. 

#### Using R

We will also be using R to connect with your new database. Prior to coming to class, please make sure you R version is up to date (latest is 3.4.3) and install RMariaDB package.
```r
#install.packages("RMariaDB")
library(RMariaDB)
```

### R

Download and install the [R base system](http://cran.rstudio.com/). I recommend you use the [R studio](http://www.rstudio.com/products/rstudio/download/) to work with the base system.

### Git

#### Windows

1.  Download the Git for Windows
    [installer](https://git-for-windows.github.io/).
2.  Run the installer and follow the steps bellow:
    1.  Click on "Next".
    2.  Click on "Next".
    3.  Click on "Next".
    4.  Click on "Next".
    5.  Click on "Next".
    6.  **Select "Use Git from the Windows Command Prompt" and click on
        "Next".** If you forgot to do this programs that you need for
        the workshop will not work properly. If this happens rerun the
        installer and select the appropriate option.
    7.  Click on "Next". **Keep "Checkout Windows-style, commit
        Unix-style line endings" selected.**
    8.  **Select "Use Windows' default console window" and click on
        "Next".**
    9.  Click on "Next".
    10. Click on "Finish".


#### Mac OS X

1. Open up the Terminal, type in "git" and press enter.
2. This should cause a pop-up window to appear. It will have several options;
   click on "Install" (not "Get Xcode", see "Installing Xcode" for that).
3. Click "Agree".
4. When the install is finished, click "Done".
5. To make sure this worked, type in "git" in the Terminal and press enter. Some
   information will come up, including a list of common commands.

If this doesn't work you can try the following:

For **OS X 10.9 and higher**, install Git for Mac by downloading and running the
most recent "mavericks" installer from
[this list](http://sourceforge.net/projects/git-osx-installer/files/).  After
installing Git, there will not be anything in your `/Applications` folder, as
Git is a command line program. For older versions of **OS X (10.5-10.8)**
use the most recent available installer labelled "snow-leopard" [available
here](http://sourceforge.net/projects/git-osx-installer/files/.)

#### Linux

Git is probably already installed. If it is not already available on your
machine you can try to install it via your distro's package manager. For
Debian/Ubuntu run `sudo apt-get install git` and for Fedora run `sudo yum
install git`.


