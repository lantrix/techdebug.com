---
title: Disk space Usage
author: Tech Debug
type: post
date: 2014-02-20T03:41:44+00:00
url: /blog/2014/02/20/disk-space-usage/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:906;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:5:"3.5.1";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:906;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - unix
tags:
  - alias
  - bash
  - code

---
I came across a useful bash alias. I don&#8217;t know where. I&#8217;ll call it dureport.  
`alias dureport='du -sdk * | awk '\''{printf "%12d\t%s\n", $1, substr($0,index($0,$2),80)}'\'' |sort -r'`