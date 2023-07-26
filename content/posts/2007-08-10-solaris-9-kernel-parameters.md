---
title: Solaris 9 Kernel Parameters
author: Tech Debug
type: post
date: 2007-08-10T00:54:22+00:00
url: /blog/2007/08/10/solaris-9-kernel-parameters/
categories:
  - unix

---
Following up from the last post, you may be interested in a little reading on Sun&#8217;s explanation of the semaphore and shared memory settings for Solaris Kernel parameters, using _/etc/system_.

set semsys:* is for [System V Semaphores][1]  
set shmsys:* is for [System V Shared Memory][2]  
set msgsys:* is for [System V Message Queues][3]

My personal server OS of choice is OpenBSD, so if you know OpenBSD, then think _[/etc/sysctl.conf][4]_ as it is similar.

 [1]: http://docs.sun.com/app/docs/doc/806-4015/6jd4gh8f6?a=view "docs.sun.com: Solaris Tunable Parameters Reference Manual"
 [2]: http://docs.sun.com/app/docs/doc/806-4015/6jd4gh8f7?a=view "docs.sun.com: Solaris Tunable Parameters Reference Manual"
 [3]: http://docs.sun.com/app/docs/doc/806-4015/6jd4gh8f5?a=view "docs.sun.com: Solaris Tunable Parameters Reference Manual"
 [4]: http://www.openbsd.org/cgi-bin/man.cgi?query=sysctl.conf&sektion=5 "Manual Pages: sysctl.conf"