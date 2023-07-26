---
title: MAMP vhost and WordPress
author: Tech Debug
type: post
date: 2010-08-26T07:30:27+00:00
url: /blog/2010/08/26/mamp-vhost-and-wordpress/
categories:
  - databases
  - Musings

---
I&#8217;ve setup MAMP to do some local web development on my MacBookPro, and the XDebug plugin is awesome for stepping through PHP code.

However, I had a problem with MAMP and a vhost I setup for local development. The wordpress front page and /wp-admin/ worked but any sub pages, etc. failed to load. When trying to access a WordPress page at url http://site.local/music/ The error in the apache logs was:

`<br />
[error] [client 127.0.0.1] File does not exist: /Users/lantrix/devel_projects/vhosts/site.local/music<br />
` 

I had made sure that mod_rewrite was enabled as mentioned by Samuel B [over at the WordPress support forums][1]. I had also ensured I had updated the permalinks in the local WordPress install, thus writing out a .htaccess for the rewrites. Still no luck.

Then I remembered, one needs to tell Apache that a directory outside the webserver root _/Applications/MAMP/htdocs_, in this case my vhost path of _/Users/lantrix/devel_projects/vhosts/site.local_, needs to have an AllowOverride so the .htaccess WordPress has placed can be used. This in combination with the apache Options directive to FollowSynLinks as [mentioned][2] by Mark at the support forums worked for me. **No more 404 errors!**

Below is my working vhost configuration at the bottom of my MAMP apache config file _/Applications/MAMP/conf/apache/httpd.conf_. It works for me, but YMMV:

 [1]: http://wordpress.org/support/topic/change-permalinks-404-local-mamp-installation?replies=12#post-1381340
 [2]: http://wordpress.org/support/topic/change-permalinks-404-local-mamp-installation?replies=12#post-1381275