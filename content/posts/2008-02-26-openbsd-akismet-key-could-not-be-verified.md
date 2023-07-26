---
title: OpenBSD – Akismet key could not be verified
author: Tech Debug
type: post
date: 2008-02-25T14:37:32+00:00
url: /blog/2008/02/26/openbsd-akismet-key-could-not-be-verified/
tags:
  - akismet
  - blog
  - openbsd
  - php
  - spam
  - wordpress
DiggUrl:
  - http://digg.com/linux_unix/OpenBSD_Akismet_key_could_not_be_verified
categories:
  - openbsd
  - webdev

---
If you are using OpenBSD to host your wordpress installation, and using the Akismet plug-in to block spam, you may come across set-up problems with Akismet.

The errors that can occur could be either or both of these:

  * There was a problem connecting to the Akismet server
  * The key you entered could not be verified because a connection to akismet.com could not be established

**There may be a couple of issues here.**  
<!--more-->

The first issue could well be you blocking outbound HTTP/HTTPS traffic to the akismet servers. This is fixed by a couple of PF rules added to your pf.conf and these are the rules I added to my PF config. YMMV:  
`<br />
<a href="http://search.twitter.com/search?q=%23Allow" class="tweet-hashtag">#Allow</a> HTTP out to specific servers<br />
pass out on $ext_if proto { tcp udp } from ($ext_if) to \<br />
{66.135.58.61, 66.135.58.62, 72.233.69.2, 72.233.69.3} port { www, https } keep state<br />
`  
The IP addresses there are the ones that the hosts _akismet.com_ and _rest.akismet.com_ resolve to. Adjust as required.

The second issue will be around name resolution. WordPress still complains with the &#8220;could not be verified&#8221; error now instead of the &#8220;problem connecting&#8221; error. However, all your tcpdumps show nothing is being blocked.

**What is the likely cause?** If you are using a default OpenBSD installation (secure by default!) then apache is probably running in a [chroot][1] &#8220;jail&#8221;. Name resolution by apache/php is done by reading your _/etc/resolv.conf_ file on start-up.  
However, the chrooted web-server can not access outside of /var/www which is the new &#8220;root&#8221; or / directory (for all intents and purposes). /etc is outside the chroot and php will not be able to do name/dns look-ups.

To confirm this is an issue, create a **testakismet.php** file in /var/www/htdocs, with the following code to test a http connection to akismet:  
`<br />
< ?php
$fp = fsockopen("rest.akismet.com", 80, $errno, $errstr, 30);
if (!$fp) {
        echo "$errstr ($errno)<br />\n";<br />
} else {<br />
        $out = "GET / HTTP/1.1\r\n";<br />
        $out .= "Host: rest.akismet.com\r\n";<br />
        $out .= "Connection: Close\r\n\r\n";</p>
<p>        fwrite($fp, $out);<br />
        while (!feof($fp)) {<br />
                echo fgets($fp, 128);<br />
        }<br />
        fclose($fp);<br />
}<br />
?><br />
`  
Load this test page at **http://<yourhost>/testakismet.php** and if you see an error, the key words being _getaddrinfo failed_, like this:  
`<br />
Warning: fsockopen() [function.fsockopen]: php_network_getaddresses: getaddrinfo failed: non-recoverable failure in name resolution in /adminosphere/akistest.php on line 2</p>
<p>Warning: fsockopen() [function.fsockopen]: unable to connect to rest.akismet.com:80 (Unknown error) in /adminosphere/akistest.php on line 2<br />
`  
**_Then your name resolution is indeed not working_** in your [OpenBSD Apache Chroot][1] &#8220;jail&#8221;. It&#8217;s locked down to /var/www and can not see your /etc/resolv.conf file.

## The fix?

Simply do the following from your web-server shell.  
Log-in as yourself, then su to root and fix this issue:  
`<br />
sudo su -<br />
mkdir -p /var/www/etc<br />
cp -p /etc/resolv.conf /var/www/etc/resolv.conf<br />
apachectl stop<br />
/usr/sbin/apachectl stop: httpd stopped<br />
apachectl start<br />
/usr/sbin/apachectl start: httpd started<br />
` 

Access your **http://<yourhost>/testakismet.php** and look for a successful HTTP connection (albeit without a valid API key at this time):  
`<br />
HTTP/1.1 200 OK X-Powered-By: PHP/4.4.4 Content-type: text/html Content-Length: 16 Date: Mon, 25 Feb 2008 14:27:57 GMT Server: LiteSpeed Connection: close Invalid API key.<br />
`  
At this time you can delete your testakismet.php file.

Log-in to your wordpress installation, **http://<yourhost>/wp-admin/plugins.php?page=akismet-key-config** and populate your akismet API key.

<p style="padding: .5em; background-color: #2d2; color: #fff; font-weight: bold;">
  This key is valid.
</p>

A win against spam, for sure&#8230;&#8230; and OpenBSD continues to keep your sever secure.

 [1]: http://www.openbsd.org/faq/faq10.html#httpdchroot