---
title: MQ6 Command Levels on Solaris
author: Tech Debug
type: post
date: 2007-09-13T08:21:16+00:00
url: /blog/2007/09/13/mq6-command-levels-on-solaris/
categories:
  - MQ
  - unix

---
The MQ command level is an integer used by MQ clients that identify what version the WebSphere MQ servers is running. This in conjunction with the Platform attribute allows a client know what commands the MQ server supports. Both are required attributes to determine usable commands.

You may be asked by someone what command level your system supports. In the case of MQ V6.0 on Solaris, the following is true:

> **MQCMDL\_LEVEL\_600**  
> Level 600 of system control commands.  
> This value is returned by the following: 
> 
> Websphere MQ for AIX V6.0  
> Websphere MQ for HP-UX V6.0  
> Websphere MQ for i/Series V6.0  
> WebSphere MQ for Linux V6.0  
> **Websphere MQ for Solaris V6.0**  
> Websphere MQ for Windows V6.0  
> Websphere MQ for z/OS V6.0

See [IBM&#8217;s doco][1] for further versions or systems.

 [1]: http://publib.boulder.ibm.com/infocenter/wmqv6/v6r0/index.jsp?topic=/com.ibm.mq.csqzak.doc/js03081.htm