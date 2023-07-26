---
title: OpenBSD, postgresql and semaphore failures during initdb
author: Tech Debug
type: post
date: 2008-04-21T14:54:13+00:00
url: /blog/2008/04/22/openbsd-postgresql-and-semaphore-failures-during-initdb/
tags:
  - openbsd
  - postgresql
  - semaphores
  - SEMMNI
  - SEMMNS
categories:
  - openbsd
  - unix

---
Today I upgraded my postgresql database instance on [OpenBSD][1]. Did a pg_dumpall, removed the old packages and then added the new ones (latest version 8.1.9 for OpenBSD 4.0 &#8211; yes I&#8217;m behind).

During the initialisation of the new DB, I got the following error:  
`<br />
creating directory /var/postgresql/data/pg_tblspc ... ok<br />
selecting default max_connections ... 10<br />
selecting default shared_buffers ... 50<br />
creating configuration files ... ok<br />
creating template1 database in /var/postgresql/data/base/1 ... FATAL:  could not create semaphores: No space left on device<br />
DETAIL:  Failed system call was semget(1, 17, 03600).<br />
`  
The PostgreSQL documentation talks about this [extensively][2]. However I don&#8217;t want to recompile my kernel away from [GENERIC][3]. What else can I do?  
<!--more-->

  
AFAIK It is not possible to pass the max_connections to initdb.

After some searching, I found the solution. It looks like the problem is that the semaphores from the old installation are still hanging around, and never got cleaned up. You can use ipcs and ipcrm to clean then up and run your initdb again.

First list the existing semaphores:  
`<br />
server:~<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> ipcs<br />
Message Queues:<br />
T       ID     KEY        MODE       OWNER    GROUP</p>
<p>Shared Memory:<br />
T       ID     KEY        MODE       OWNER    GROUP<br />
m    65536    5432001 --rw------- _postgresql _postgresql</p>
<p>Semaphores:<br />
T       ID     KEY        MODE       OWNER    GROUP<br />
s  1376256          0 --rw-------      www      www<br />
s  1245185          0 --rw-------      www      www<br />
s    65538    5432001 --rw------- _postgresql _postgresql<br />
s    65539    5432002 --rw------- _postgresql _postgresql<br />
s    65540    5432003 --rw------- _postgresql _postgresql<br />
s    65541       5419 --rw-r--r--      www      www<br />
`  
You want to remove the semaphore sets according to the [ipcrm man page][4]:  
`<br />
server:~<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> ipcrm -s 65538<br />
server:~<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> ipcrm -s 65539<br />
server:~<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> ipcrm -s 65540<br />
`  
Running _ipcs_ again shows the _postgresql semaphores gone:  
`<br />
Semaphores:<br />
T       ID     KEY        MODE       OWNER    GROUP<br />
s  1376256          0 --rw-------      www      www<br />
s  1245185          0 --rw-------      www      www<br />
s    65541       5419 --rw-r--r--      www      www<br />
`  
Now you can switch to the postgres account and run your initdb:  
`<br />
server:/usr/local/share/postgresql<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> su - _postgresql<br />
<a href="http://search.twitter.com/search?q=%23initdb" class="tweet-hashtag">#initdb</a><br />
The files belonging to this database system will be owned by user "_postgresql".<br />
This user must also own the server process.</p>
<p>The database cluster will be initialized with locale C.</p>
<p>creating directory /var/postgresql/data ... ok<br />
creating directory /var/postgresql/data/global ... ok<br />
creating directory /var/postgresql/data/pg_xlog ... ok<br />
creating directory /var/postgresql/data/pg_xlog/archive_status ... ok<br />
creating directory /var/postgresql/data/pg_clog ... ok<br />
creating directory /var/postgresql/data/pg_subtrans ... ok<br />
creating directory /var/postgresql/data/pg_twophase ... ok<br />
creating directory /var/postgresql/data/pg_multixact/members ... ok<br />
creating directory /var/postgresql/data/pg_multixact/offsets ... ok<br />
creating directory /var/postgresql/data/base ... ok<br />
creating directory /var/postgresql/data/base/1 ... ok<br />
creating directory /var/postgresql/data/pg_tblspc ... ok<br />
selecting default max_connections ... 40<br />
selecting default shared_buffers ... 1000<br />
creating configuration files ... ok<br />
creating template1 database in /var/postgresql/data/base/1 ... ok<br />
`  
And so on it goes successfully creating your initial DB.  
I hope this helps someone else!

 [1]: http://www.openbsd.com/
 [2]: http://www.postgresql.org/docs/8.1/static/kernel-resources.html#SYSVIPC
 [3]: http://www.openbsd.org/faq/faq5.html#BldKernel
 [4]: http://www.openbsd.org/cgi-bin/man.cgi?query=ipcrm&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=i386&format=html