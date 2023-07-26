---
title: Leopard, Apache2 and MySQL
author: Tech Debug
type: post
date: 2009-05-23T12:51:56+00:00
url: /blog/2009/05/23/leopard-apache2-and-mysql/
categories:
  - apple
  - tech
tags:
  - mac
  - mysql
  - plugin
  - twitter
  - wordpress

---
<img decoding="async" loading="lazy" style="float: right; margin-bottom: 10px; margin-left: 10px" alt="MacBook Pro" src="http://images.apple.com/au/macbookpro/images/overview-15inch20090106.jpg" class="alignright" width="222" height="149" />  
I&#8217;ve just cloned this blog to a development version on my Macbook Pro. The Mac has Apache2 installed by default, so I just had to get mysql working. 

Downloading MySQL and installing on Leopard is a breeze with the [native package][1].

I [migrated][2] my database (dump/restore) and recreated my wordpress user, but still kept getting this error:

### Error establishing a database connection

The user could log into the database from the console as shown:  
`<br />
lantrix@lexx:~ $ mysql -u wordpress -p<br />
Enter password:<br />
Welcome to the MySQL monitor.  Commands end with ; or \g.<br />
Your MySQL connection id is 19<br />
Server version: 5.1.34 MySQL Community Server (GPL)</p>
<p>Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.</p>
<p>mysql> use wordpress;<br />
Reading table information for completion of table and column names<br />
You can turn off this feature to get a quicker startup with -A</p>
<p>Database changed<br />
mysql> show tables;<br />
+-----------------------------+<br />
| Tables_in_wordpress         |<br />
+-----------------------------+<br />
| sk2_blacklist               |<br />
` 

So what is the problem?

Google provides an answer, with a log lived post from My Macinations [providing the solution][3]. It&#8217;s all to do with correcting your php.ini with the proper MySQL socket location.

Now, back to testing my new version of the Twitter Tags wordpress plugin. [#hashtags][4]{.tweet-hashtag} now work!

 [1]: http://dev.mysql.com/doc/refman/5.0/en/mac-os-x-installation.html
 [2]: http://www.mydigitallife.info/2007/07/21/how-to-backup-and-restore-export-and-import-mysql-databases-tutorial/
 [3]: http://mymacinations.com/2007/10/28/apache-php-and-mysql-on-leopard/
 [4]: http://search.twitter.com/search?q=%23hashtags