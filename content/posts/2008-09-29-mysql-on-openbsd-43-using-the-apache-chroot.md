---
title: MySQL on OpenBSD 4.3 using the Apache Chroot
author: Tech Debug
type: post
date: 2008-09-29T07:26:11+00:00
url: /blog/2008/09/29/mysql-on-openbsd-43-using-the-apache-chroot/
categories:
  - openbsd
  - unix
  - webdev
tags:
  - openbsd 4.3 mysql chroot apache

---
I&#8217;m back with some more tech geek goodness for anyone who uses [MySQL][1] and [OpenBSD][2].

OpenBSD by default apache runs in a [chroot jail][3], thereby making it more secure in case the www server is compromised. I have talked about this before.

However if you use wordpress or some other web application that needs MySQL (and I&#8217;m talking where apache and MySQL reside on the same host), then the chroot jail will not allow your webapp access to the mysql socket file which is by default located in _/var/run/mysql/_

There are various solutions available online to wait x number of seconds and then to create symlinks, etc &#8211; but this was not always working for me &#8211; with the result the server would sometimes be up without database availability.

Here is my solution (thanks to [NoMoa][4] for the idea) &#8211; very simple, no postfix symlink but there is a symlink to allow other applications to access MySQL locally via the default socket location.

First I create the run dirs in the apache jail:  
`<br />
mkdir -p /var/www/var/run/mysql<br />
chown _mysql:_mysql /var/www/var/run/mysql<br />
chmod 711 /var/www/var/run/mysql<br />
` 

Then I add this to the bottom of _/etc/rc.local_ on the webhost.  
`<br />
<a href="http://search.twitter.com/search?q=%23mySQL" class="tweet-hashtag">#mySQL</a><br />
if [ X"${mysql}" == X"YES" -a -x /usr/local/bin/mysqld_safe ]; then<br />
        echo -n " mysqld"; /usr/local/bin/mysqld_safe --user=_mysql --log --open-files-limit=256 --socket=/var/www/var/run/mysql/mysql.sock &<br />
        if [ ! -L /var/run/mysql/mysql.sock ]; then<br />
                mkdir -p /var/run/mysql<br />
                chown _mysql:_mysql /var/run/mysql<br />
                chmod 711 /var/run/mysql<br />
                ln -fs /var/www/var/run/mysql/mysql.sock /var/run/mysql/mysql.sock<br />
        fi<br />
fi<br />
`  
Lastly I add this to my _/etc/rc.conf.local_  
`<br />
mysql=YES<br />
` 

**Note:** you may need to change the open-files-limit to suit, but the above paths are as per a standard OpenBSD 4.3 install using the supplied MySQL pkgs.

I tested this all out on OpenBSD 4.3 and it now works fine for me. Whenever the server comes up I never get the dreaded word press DB failure screen. **Good luck**

 [1]: http://www.sun.com/software/products/mysql/
 [2]: http://www.openbsd.org
 [3]: http://en.wikipedia.org/wiki/Chroot
 [4]: http://nomoa.com/bsd/mysql.htm