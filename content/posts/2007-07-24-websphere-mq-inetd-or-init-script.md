---
title: Websphere MQ – inetd or init script
author: Tech Debug
type: post
date: 2007-07-24T08:08:40+00:00
url: /blog/2007/07/24/websphere-mq-inetd-or-init-script/
categories:
  - tech
  - unix

---
Was implementing an MQ cluster at work recently, and the question arose on setting up init scripts for MQ, specifically the listener, runmqlsr. I was advised that inetd is the usual method for setting up any MQ daemon.

However, I read a blog post on [A Hursley view on MQ][1] blog, and it stated that launching the runmqlsr seperately, and not using inetd is the now preferred method of having your MQ daemon running.

They point to an [IBM FAQ][2] that says since MQ V5.3, using inetd (amqcrsta) is a &#8220;&#8230; massively unthreaded approach&#8221; to having MQ listen for messages.

In our Load testing, we have not used inetd (pointing to amqcrsta) as the listener, but runmqlsr.  
We have decided to continue this into production as changing this may invalidate our load testing results.

I will be, on Solaris 9, setting up a SYSV init script setup for the MQ runmqlsr script we already use. A happy me, and a happy MQ server.

 [1]: http://hursleyonwmq.wordpress.com/2007/07/12/why-is-runmqlsr-now-the-recommended-listener-over-inetd/
 [2]: http://www-304.ibm.com/jct09002c/isv/tech/faq/individual.jsp?oid=1:81789