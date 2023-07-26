---
title: Coral Content Distributed network
author: Tech Debug
type: post
date: 2008-04-20T11:06:28+00:00
url: /blog/2008/04/20/coral-distributed-dns-network/
tags:
  - apache
  - content distribution
  - slashdot
categories:
  - Musings
  - tech
  - unix
  - webdev

---
Have you ever had your website hit on a topic that people find conflicting? When the site gets viewed by the masses, you need to be prepared. If you have access to modify your web server .htaccess file then go and have a read of the [Coral CDN Overview][1]  
For those interested in the techie bits, here is my .htaccess for news site flood protection, and to allow CDN to serve up all my site images &#8211; thus offloading from my puny connection the bandwidth burden for images.  
`<br />
<ifmodule mod_rewrite.c><br />
RewriteEngine On<br />
<a href="http://search.twitter.com/search?q=%23prevent" class="tweet-hashtag">#prevent</a> slashdot effect<br />
RewriteCond %{HTTP_USER_AGENT} !^CoralWebPrx<br />
RewriteCond %{HTTP_REFERER} blogspot\.com [NC,OR]<br />
RewriteCond %{HTTP_REFERER} reddit\.com [NC,OR]<br />
RewriteCond %{HTTP_REFERER} digg\.com [NC,OR]<br />
RewriteCond %{HTTP_REFERER} news\.slashdot\.org [NC,OR]<br />
RewriteCond %{HTTP_REFERER} slashdot\.org<br />
RewriteRule ^(.*)$ https://techdebug.com.nyud.net/$1 [R,L]<br />
<a href="http://search.twitter.com/search?q=%23Rewrite" class="tweet-hashtag">#Rewrite</a> images to allow CDN to serve them<br />
RewriteCond %{HTTP_USER_AGENT} !^CoralWebPrx<br />
RewriteRule ^(.*)/(.*\.(gif|png|jpe?g))$ https://techdebug.com.nyud.net/$1/$2 [R,L]<br />
<a href="http://search.twitter.com/search?q=%23Wordpress" class="tweet-hashtag">#Wordpress</a> rewites<br />
RewriteBase /<br />
RewriteCond %{REQUEST_FILENAME} !-f<br />
RewriteCond %{REQUEST_FILENAME} !-d<br />
RewriteRule . /index.php [L]<br />
</ifmodule><br />
`  
mod_rewrite is your [friend][2].

 [1]: http://www.coralcdn.org/overview/
 [2]: http://httpd.apache.org/docs/1.3/mod/mod_rewrite.html