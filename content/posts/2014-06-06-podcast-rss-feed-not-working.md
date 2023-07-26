---
title: Podcast RSS Feed (XML file) not working on WordPress Site
author: Tech Debug
type: post
date: 2014-06-06T07:05:55+00:00
url: /blog/2014/06/06/podcast-rss-feed-not-working/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:980;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.6";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:980;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - internet
  - tech
tags:
  - 404
  - feed
  - godaddy managed wordpress
  - not found
  - podcast
  - rss
  - RSS feed
  - SEO
  - XML
  - yoast

---
I host this blog in WordPress, and it&#8217;s a great micro CMS with all the bells and whistles. I also publish and host the XML file for a podcast of the [Angry Human][1]. It&#8217;s picked up by feed burner, and then iTunes takes the feed burner RSS feed and et voila! All the Apple listeners to the show Angry Human by David Biedny get their recent shows!

I recently had an issue where I&#8217;ve moved this site from Rackspace Cloud Sites to the Godaddy Managed WordPress sites. One of the things that was happening was the URI for the podcast XML RSS feed was returning as a 404 not found; even though it was there. Nothing I tried made this thing work, and nowhere could I find other people talking about RSS XML files published alongside wordpress not working. Even adding a new .htaccess file in the subfolder on the server to turn off URL rewrites did not work.

Another client I had recently worked with wanted some SEO optimisations, and we ended up implementing the awesome [WordPress SEO plugin][2] by Joost de Valk . One of the things I had noted about this plugin on the Godaddy hosting, was that the XML site map feature used to help bots index the site, was not working. We fixed this quite easily with a [commonly known fix][3] in the .htaccess file on the WordPress host.

I had not groked this similar error until an &#8220;Aha&#8221; moment when I realised an XML file, whether it be sitemap.xml or angryhuman.xml had been invoking the same rewrite error causing a 404 not found on a valid URI for a hosted file. Double checking and I had indeed implemented WordPress SEO plugin on this site.

The root cause: any self published XML file outside of the standard wordpress folders on a GoDaddy Managed WordPress Site &#8211; will return a 404 not found if you are using WordPress 3.9 and WordPress SEO by Yoast.

Therefore the fix in this case for my self published XML feed for Angry Human was adding this to the .htaccess:

 [1]: http://www.rocklandworldradio.com/program/angryhuman
 [2]: https://yoast.com/wordpress/plugins/seo/
 [3]: http://www.wpcub.com/sitemap-xml-404-found-yoast/