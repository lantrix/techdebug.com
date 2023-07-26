---
title: Tuning Solaris 9 for MQ V6.0
author: Tech Debug
type: post
date: 2007-08-10T00:35:44+00:00
url: /blog/2007/08/10/tuning-solaris-9-for-mq-v60/
categories:
  - apps
  - MQ
  - unix

---
I was working on a recently built Solaris 9 server with a fresh copy of MQ installed.  
During application testing, we were getting 2195 errors from our application when establishing more than 3 concurrent connects to MQ. 

After a day of wasted de-bugging of our application, we put it down to the system, and it seems we may have been correct. There is an install chapter in the MQ V6.0 documentation that should NOT be overlooked.

Quoting the [Websphere MQ 6.0 Install Guide][1]

> WebSphere® MQ uses semaphores, shared memory, and file descriptors, and it is probable that the default resource limits are not adequate.
> 
> Review the system&#8217;s current resource limit configuration.
> 
> As the root user, load the relevant kernel modules into the running system by typing the following commands:  
> `<br />
modload -p sys/msgsys<br />
modload -p sys/shmsys<br />
modload -p sys/semsys<br />
`  
> Then display your current settings by typing the following command:  
> `sysdef`  
> Check that the following parameters are set to the minimum values required by WebSphere MQ, or higher. 

You can see their minimum value tables in the [Resource limit configuration][2] Chapter of the MQ 6.0 Install Guide.

 [1]: http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/topic/com.ibm.mq.amqdac.doc/sq10360_.htm?resultof=%22%73%68%6d%73%79%73%22%20%22%73%68%6d%73%79%22%20
 [2]: http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/topic/com.ibm.mq.amqdac.doc/sq10360_.htm?resultof=%22%73%68%6d%73%79%73%22%20%22%73%68%6d%73%79%22%20 "Resource limit configuration"