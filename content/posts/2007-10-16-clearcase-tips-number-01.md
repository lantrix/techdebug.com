---
title: Clearcase Tips number 01
author: Tech Debug
type: post
date: 2007-10-16T08:17:57+00:00
url: /blog/2007/10/16/clearcase-tips-number-01/
tags:
  - clearcase
  - find
  - tips
  - unix
DiggUrl:
  - http://digg.com/software/Clearcase_Tips_number_01
categories:
  - clearcase
  - unix

---
I found myself writing down example commands in clearcase (V6), so I thought I would share them. If you have ever needed to find files like you do in UNIX, but want to be clearcase specific, then these commands will give you a quick headstart on using the cleartool find command:

How do I list all files and file versions going into a specific build that is labelled?  
Assume your label is _TR1\_PRE\_RELEASE_  
`<br />
	cleartool find . -version 'lbtype (TR1_PRE_RELEASE)' -print<br />
`  
How do I find the latest versions on branch xyz?  
In this example, branch xyz is the _tst_ branch  
`<br />
	cleartool find . -version 'version (.../tst/LATEST)' -print<br />
`  
How do I find the latest versions on xyz branch WITHOUT a specific label?  
For this example the xyz branch is the _main_ (default clearcase) branch, and the label is _TR1\_PRE\_RELEASE_  
`<br />
	cleartool find . -version 'version (/main/LATEST) && ! lbtype(TR1_PRE_RELEASE)' -print<br />
`  
How do I see what in the filesystem has changed from clearcase?  
This example only works if you have set your view on the same machine where the file system to compare is.  
`<br />
	cd /<clearcase mount path>/<br />
	clearfsimport -preview -recurse /<your app dir>/* .|grep -v unchan |grep -v identi<br />
`  
I hope that gives you incentive to go and read the [clearcase find documentation][1] and learn more for yourself by trying.

 [1]: http://publib.boulder.ibm.com/infocenter/cchelp/v7r0m0/index.jsp?topic=/com.ibm.rational.clearcase.cc_ref.doc/topics/ct_find.htm ""