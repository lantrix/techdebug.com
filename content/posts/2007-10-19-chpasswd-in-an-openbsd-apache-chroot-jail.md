---
title: chpasswd in an OpenBSD apache chroot jail
author: Tech Debug
type: post
date: 2007-10-19T00:37:48+00:00
url: /blog/2007/10/19/chpasswd-in-an-openbsd-apache-chroot-jail/
categories:
  - apps
  - openbsd
  - unix

---
I&#8217;ve recently re-installed OpenBSD and had to set-up my squid intranet password changing tool again. The app I use is [chpasswd][1] Version 2.2.3.

I had some trouble with getting it working in the default apache chroot jail, and found very little information out there on this app in a chroot jail. Here are my notes I recorded and and steps I took. Hope it helps someone else, but [YMMV][2]:

Download chpasswd to /tmp  
`<br />
	cd /tmp<br />
	tar -zxvf chpasswd-2.2.3.tar.gz<br />
	cd chpasswd-2.2.3<br />
	./configure --enable-cgidir=/var/www/cgi-bin/ --prefix=/etc<br />
	make &&	make install<br />
	make clean<br />
`  
Setup apache for CGI running in the chroot jail  
`<br />
	mkdir /var/www/etc<br />
	mkdir /var/www/tmp<br />
	mkdir -p /var/www/var/tmp<br />
	chmod 777 /var/www/tmp<br />
	chmod 777 /var/www/var/tmp<br />
	mv /etc/chpasswd* /var/www/etc/<br />
`  
Check which libs are compiled against chpasswd  
`<br />
	ldd /var/www/cgi-bin/chpasswd.cgi<br />
`  
Output should be similar to the following:  
`<br />
/var/www/cgi-bin/chpasswd.cgi:<br />
	Start    End      Type Ref Name<br />
	00000000 00000000 exe   1  /var/www/cgi-bin/chpasswd.cgi<br />
	03d1e000 23d4f000 rlib  1  /usr/lib/libc.so.38.2<br />
	09e55000 09e55000 rtld  1  /usr/libexec/ld.so<br />
`  
Copy the libs that chpasswd.cgi uses, shown from the ldd output, to the jail  
`<br />
	mkdir -p /var/www/usr/lib<br />
	mkdir -p /var/www/usr/libexec<br />
	cp /usr/lib/libc.so.38.2 /var/www/usr/lib/<br />
	cp /usr/libexec/ld.so /var/www/usr/libexec/<br />
`  
Update chpasswd configuration:  
`<br />
	cd /var/www/etc<br />
	vi chpasswd.conf<br />
	vi ipauth<br />
`  
Create squid passwd file for chpasswd to update in chroot jail  
`<br />
	mkdir /var/www/etc/squid<br />
	touch /var/www/etc/squid/passwd<br />
	chown root:www /var/www/etc/squid/passwd<br />
	chmod 660 /var/www/etc/squid/passwd<br />
`  
Update/Modify the auth\_param section of squid.conf to use new passwd file and basic authentication (must already have ncsa\_auth in place and working)  
`<br />
	vi /etc/squid/squid.conf<br />
	<samp><br />
		auth_param basic program /usr/local/squid/libexec/ncsa_auth /var/www/etc/squid/passwd<br />
		auth_param basic children 5<br />
		auth_param basic realm Home Localnet to Internet access<br />
		auth_param basic credentialsttl 2 hours<br />
	</samp><br />
`  
Restart squid  
`<br />
	squid -k reconfigure<br />
`  
_Your app should now be usable at http://<your.squidserver>/cgi-bin/chpasswd.cgi_

 [1]: http://sarg.sourceforge.net/chpasswd.php "chpasswd"
 [2]: http://en.wikipedia.org/wiki/Your_mileage_may_vary "Your mileage may vary - Wikipedia, the free encyclopedia"