---
title: Server Migration complete
author: Tech Debug
type: post
date: 2008-07-06T12:29:58+00:00
url: /blog/2008/07/06/server-migration-complete/
categories:
  - internet
  - Musings
  - webdev

---
I&#8217;ve had an on/off outage for most of the past 4 days, so to avoid hassles I put the site into maintenance mode.

I&#8217;ve actually had to decommission my 19&#8243; server rack and the multiple servers I had for Tech Debug. There was a DNS server, kerberos, Database and web server. All the separate functions are now hosted on one OpenBSD VM that I&#8217;ve built recently. It&#8217;s running on the only remaining &#8220;non-laptop&#8221; left in my residence, which runs 24&#215;7.

The only delay in getting back online in the last 48 hours was the MySQL data export and import. It&#8217;s a bit convoluted, and not documented in entirely one place on the MySQL documentation site (backup [here][1], restore [here][2]), however once done once it will be easy to repeat. I still like the simplicity of PostgreSQL administration. Specifically the backup and restore:

Backup:  
`pg_dumpall > savefile.dump`  
Restore:  
`psql -f savefile.dump postgres`

Well, there are some prep steps you should do; but it is all in [one place][3] on their documentation page.

Let me know how the site performs on the VM.

 [1]: http://dev.mysql.com/doc/refman/5.0/en/backup.html
 [2]: http://dev.mysql.com/doc/refman/5.0/en/mysqlimport.html
 [3]: http://www.postgresql.org/docs/8.1/static/backup.html