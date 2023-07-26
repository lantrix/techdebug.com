---
title: Git on 10.04 Ubuntu LTS
author: Tech Debug
type: post
date: 2011-12-06T12:51:34+00:00
url: /blog/2011/12/06/git-on-10-04-ubuntu-lts/
wordtwit_posted_tweets:
  - 'a:1:{i:0;s:3:"850";}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";s:0:"";s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";s:2:"60";s:7:"version";s:3:"3.2";s:14:"tweet_template";s:0:"";s:6:"status";s:1:"2";s:6:"result";a:0:{}s:13:"tweet_counter";s:1:"2";s:13:"tweet_log_ids";a:1:{i:0;s:3:"850";}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - git
  - unix
tags:
  - cloud
  - git
  - linux
  - rackspace
  - SCM
  - ubuntu

---
This is more for me than you, however if you need Git on Ubuntu 10.04 (LTS) try this. The commands I ran get the [pre-packaged PPA Git][1] working on Ubuntu 10.04:  
`sudo apt-get install python-software-properties<br />
sudo add-apt-repository ppa:git-core/ppa<br />
sudo aptitude update<br />
sudo aptitude safe-upgrade<br />
sudo aptitude install git`

 [1]: http://launchpad.net/git/