---
title: Is SNI viable?
author: Tech Debug
type: post
date: 2014-12-04T23:00:55+00:00
url: /blog/2014/12/05/is-sni-viable/
wordtwit_posted_tweets:
  - 'a:2:{i:0;i:1009;i:1;i:1011;}'
wordtwit_post_info:
  - 'O:8:"stdClass":14:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:5:"3.0.4";s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:3;s:13:"tweet_log_ids";a:2:{i:0;i:1009;i:1;i:1011;}s:9:"hash_tags";a:5:{i:0;s:3:"SNI";i:1;s:7:"hosting";i:2;s:6:"apache";i:3;s:6:"webdev";i:4;s:3:"TLS";}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}s:4:"text";s:80:"Is SNI viable? by @lantrix - http://bit.ly/m2F54Q #SNI #hosting #apache #webdev ";s:14:"tweet_template";b:0;}'
categories:
  - internet
  - tech
  - webdev
tags:
  - apache
  - security
  - SNI
  - TLS
  - vhost
  - webdev

---
Traditionally if one was to secure a web server using TLS (or previously, SSL) &#8211; then one would configure your web server to use TCP port 443 to listen for TLS requests from clients (browsers). When a browser connects to the web server using the HTTPS protocol, the server would encrypt the communications and all would be well with the world.

A problem occurs when you use name based Virtual Hosting on your web server. If you need to determine the client request before providing content from a virtual host, e.g. blah.com vs. blahblah.com, then this couldn&#8217;t be done if you encrypted the communications using TLS. Enter stage left: _Server Name Indication_.

According to [Wikipedia][1]:

> Server Name Indication is a feature that extends the SSL and TLS protocols. It permits the client to request the domain name before the certificate is committed to the server. This is essential for using TLS in virtual hosting mode.

I&#8217;ve a need to use Server Name Indication (SNI) for [some][2] freelance IT work I perform, but colleagues shy away from SNI since Internet Explorer on Windows XP is unsupported.

Is this an issue? Are so many people still on Windows XP that it will diminish the security aspects of implementing SSL to secure input of personal data ?

One of the best places to determine OS usage trends in Australia would be from Google, but they don&#8217;t provide such data. Therefore I turn to another source of data: StatCounter. They have been [providing stats][3] to websites and business for well over 10 years, so their data should be viable.

<div id="desktop-os-AU-monthly-201401-201412" style="width: 600px; height: 400px;">
</div>

<!-- You may change the values of width and height above to resize the chart -->

Source: [StatCounter Global Stats &#8211; OS Market Share][4]

  
The chart above shows Operating system usage for 2014 in Australia. Windows XP sits at 4 percent usage at the end of 2014. For an operating system that&#8217;s now unsupported and 4 Major versions old; it just shouldn&#8217;t be considered anymore.

<div id="desktop-browser_version_partially_combined-AU-daily-20140101-20141201" style="width: 600px; height: 400px;">
</div>

<!-- You may change the values of width and height above to resize the chart -->

Source: [StatCounter Global Stats &#8211; Combine Chrome (all versions) & Firefox (5+) Market Share][5]



The second chart shows browser usage statistics in 2014. Internet Explorer 6, which doesn&#8217;t support SNI, isn&#8217;t even on the chart anymore.

Knowing the actual statistics &#8211; the usage of Internet Explorer 6 (or a lesser version) and Windows XP seems to be **so minimal** that usage of SNI is a viable option; especially where it gives a rise to cost saving on implementation of x509 certificates on web front ends. What do you think?

 [1]: http://en.wikipedia.org/wiki/Server_Name_Indication
 [2]: http://alphapress.com.au
 [3]: http://statcounter.com/about/
 [4]: http://gs.statcounter.com/#desktop-os-AU-monthly-201401-201412
 [5]: http://gs.statcounter.com/#desktop-browser_version_partially_combined-AU-daily-20140101-20141201