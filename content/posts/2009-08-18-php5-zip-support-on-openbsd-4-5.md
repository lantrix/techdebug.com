---
title: PHP5 Zip Support on OpenBSD 4.5
author: Tech Debug
type: post
date: 2009-08-17T15:37:59+00:00
url: /blog/2009/08/18/php5-zip-support-on-openbsd-4-5/
categories:
  - openbsd
  - unix
  - webdev
tags:
  - CiviCRM
  - pear
  - pecl
  - php5
  - zip
  - zziplib

---
This is a cheat sheet on getting PHP5 on OpenBSD to have zip support. I needed this to get [CiviCRM][1] to work with Joomla.

First off install some require packages, including the zziplib package:  
`<br />
	export PKG_PATH=http://mirror.aarnet.edu.au/pub/OpenBSD/4.5/packages/i386/<br />
	pkg_add -v zziplib<br />
	pkg_add -v autoconf-2.62<br />
`  
Now download and extract the PECL zip package:  
`<br />
	mkdir /usr/local/src/<br />
	cd /usr/local/src/<br />
	wget http://pecl.php.net/get/zip<br />
	tar zxvf zip<br />
	cd zip-1.10.2/<br />
`  
Compile PECL zip, making sure you set your [correct autoconf][2] to use:  
`<br />
	export AUTOCONF_VERSION=2.62<br />
	phpize<br />
	./configure<br />
	make<br />
	make install<br />
`  
Finally setup php5 and restart httpd:  
`<br />
	cat << EOF >> /var/www/conf/php.ini<br />
	extension=zip.so<br />
	EOF<br />
	sudo apachectl stop<br />
	sudo apachectl start<br />
` 

Of course, this will go stale over time as new releases and versions come out, so YMMV.

 [1]: http://wiki.civicrm.org/confluence/display/CRMDOC/CiviCRM+Documentation "CiviCRM Documentation - CiviCRM 2.2 Documentation - CiviCRM Wiki"
 [2]: http://marc.info/?l=openbsd-misc&m=116524888816542&w=2 "'Re: autoconf error message suggestion' - MARC"