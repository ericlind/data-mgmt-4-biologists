---
layout: page
element: notes
title: MAMP Import database 
language: R
---

#### Create a new database in MAMP
Once you have the MySQL and associated server running with MAMP,
you can import a shared database. In this case we will add the
data we have been working with from the Bee Lab.  
  
##### Open a connection to the MAMP database in MySQL. 

1. Ensure that [MAMP is running]({{ site.baseurl}}/materials/mamp-setup)
2. Open [MySQL Workbench]({{ site.baseurl}}/materials/sql-mysql-workbench-setup)  
	- open the connection to the MAMP database (port 8889) 
3. Import data from Bee Lab "Dump file"
	- Under "Management" choose `Data Import/Restore`
	- Click the "Import from Self-Contained File" radio button
	- Navigate to local repository [ENT5920_DatabaseTutiorial]({{ site.baseurl }}/materials/sql-setup) and
	choose `/Databases_19Feb2018/Data/ENT5920_local.sql`
	- Next to Schema dropdown choose "New" and enter `BeeLab`
	- click "Start Import" and check resulting log file for errors
4. Close the Import tab - in "Query" tab should now see `BeeLab` as a choice under "Schema"