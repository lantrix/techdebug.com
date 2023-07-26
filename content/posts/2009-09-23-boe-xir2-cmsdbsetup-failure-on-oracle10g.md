---
title: BOE XIR2 cmsdbsetup failure on Oracle10g
author: Tech Debug
type: post
date: 2009-09-23T08:00:54+00:00
url: /blog/2009/09/23/boe-xir2-cmsdbsetup-failure-on-oracle10g/
categories:
  - apps
  - unix
tags:
  - 10g
  - 32bit
  - boe
  - business objects
  - clntsh
  - lib32
  - libclntsh.so
  - oracle
  - solaris
  - unix

---
If you use Unix, and need to migrate your Business objects CMS from one database to another database, you will probably use the _cmsdbsetup.sh_ script. This script migrates and manages your database connection in a Unix environment using Business Objects Enterprise (BOE).

In my case I am Using Solaris 9, and have Oracle 10g databases and client files for use by BOE.

When running the _cmsdbsetup.sh_ script you get the following error pertaining to **clntsh**:  
`<br />
           Business Objects </p>
<p>Current CMS Data Source: DBNAME </p>
<p>err: Error: Failed to get cluster name.<br />
err: Error description: Unable to load clntsh </p>
<p>select (Select a Data Source)<br />
reinitialize (Recreate the current Data Source)<br />
copy (Copy data from another Data Source)<br />
changecluster (Change current cluster name)<br />
selectaudit (Select an Auditing Data Source) </p>
<p>[select(6)/reinitialize(5)/copy(4)/changecluster(3)/selectaudit(2)/back(1)/quit(0)]<br />
----------------------------------------------------------<br />
` 

This error &#8220;_Unable to load clntsh_&#8221; refers to the **libclntsh.so** library used by the Oracle client. Since BOE runs as 32bit, the 32bit Oracle client libraries should be accessible by the user running BOE.

If you are running a 64 bit Unix and a 64bit Oracle install check that the environment for the user running BOE (user that will run the CMS) has the 32bit libraries in the path:  
`LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$ORACLE_HOME/lib32`

Then check that either the user is a member of the Oracle dba Unix group or everyone has permissions to access the 32bit libraries under Oracle 10g:

`su - oracle<br />
chmod o+rx $ORACLE_HOME/lib32/*`

Feel free to leave any comments if you need help with this.