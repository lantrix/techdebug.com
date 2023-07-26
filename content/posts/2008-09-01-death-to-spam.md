---
title: Death to Spam
author: Tech Debug
type: post
date: 2008-09-01T01:07:12+00:00
url: /blog/2008/09/01/death-to-spam/
categories:
  - openbsd
tags:
  - akismet
  - chroot
  - openbsd
  - resolv.conf
  - spam

---
I&#8217;ve been hit by a number of Spam comments recently that snuck through the filters.

If you are subscribed to the comments feed, apologies for this.

It turns out that since I moved TechDebug to a VM host, I did not follow my [own post][1] and the spam tools where not connecting to Akismet to check the comments. So remember that if you use OpenBSD and the default chroot for Apache, then you need to setup a resolv.conf to allow Apache to resolve hostnames.

It should be all fixed now. If I still get them sneaking through I may have to turn on &#8220;logins&#8221; to allow commenting. This is my last resort so it&#8217;s not in place yet.

 [1]: https://techdebug.com/blog/2008/02/26/openbsd-akismet-key-could-not-be-verified/