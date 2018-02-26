---
layout: page
element: notes
title: MAMP Setup 
language: R
---

#### Installing your server

First, we will need to install a server. MAMP is a simple, 
free and powerful software bundle for running a server. 
MAMP stands for **M**y (or *M*ac) **A**pache - **M**ySQL - **P**HP. 

[Download MAMP](https://www.mamp.info/en/) if you haven't done so. 
	
#### Install and start MAMP

Install MAMP by opening the file. Note that MAMP PRO is a 
paid version therefore be sure to uncheck boxes that request
 you download the pro version. Installation could take a few minutes.

Once installation is complete, open MAMP.
Two little green dots next to Apache Server and MySQL Server 
should show up indicating that it is working. 
It may also open the MAMP website automatically.

We will configure ports here so that everyone is on the same
 page and code is consistent. Click on "Preferences".   
  
  Change Apache to *8888*   
  Change MySQL to *8889*

#### MySQL Client

[Install MySQL Workbench]({{ site.baseurl }}/materials/sql-mysql-workbench-setup)

Create a new connection to start:

Prompt        | To Enter
------------- |----------
Host/IP type  | 127.0.0.1
User          |  root
Password      |  root
Port          |  8889

Once you have done this, you have successfully created a MySQL 
server and connected it via a local client!  

This will allow you to create and access a database. 
