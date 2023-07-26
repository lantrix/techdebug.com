---
title: PowerShell to Configure BizTalk Server 2013 Host and Host Instances
author: Tech Debug
type: post
date: 2014-01-21T03:06:03+00:00
url: /blog/2014/01/21/powershell-to-configure-biztalk-server-2013-host-and-host-instances/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:901;}'
wordtwit_post_info:
  - 'O:8:"stdClass":14:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.3";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:5;s:13:"tweet_log_ids";a:4:{i:0;i:898;i:1;i:899;i:2;i:900;i:3;i:901;}s:9:"hash_tags";a:3:{i:0;s:7:"biztalk";i:1;s:7:"bts2013";i:2;s:10:"powershell";}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}s:4:"text";s:104:"PowerShell to Configure #BizTalk Server 2013 Host and Host Instances by @lantrix - http://bit.ly/1h6UN0w";}'
categories:
  - BizTalk2013
  - integration
tags:
  - automate
  - biztalk2013
  - bts2013
  - powershell
  - SB-Messaging
  - script
  - WCF-BasicHttpRelay
  - WCF-NetTcpRelay
  - WCF-WebHttp

---
Everyone loves automated processes.

With BizTalk 2013 if you want to provide a repeatable install; you need automation. PowerShell is where it&#8217;s at.  
Lucky for me, other very skilled people already have written PowerShell scripts providing the capability to create hosts and host instances. [Sandro Pereira][1] has written and published a PowerShell [script][2] to create your BizTalk host instances based upon the best practice of host separation. However, it&#8217;s only written for BizTalk 2010.

I&#8217;ve gone and modified it for BizTalk 2013. It provides the exact same capability, with BizTalk 2013 capabilities.  
This includes new Receive Port Handlers:

  * SB-Messaging
  * SFTP
  * WCF-BasicHttpRelay
  * WCF-NetTcpRelay

And New Send Port Handlers:

  * SB-Messaging
  * SFTP
  * WCF-BasicHttpRelay
  * WCF-NetTcpRelay
  * WCF-WebHttp (the new adapter supporting [REST][3])

The diff to the BTS2010 version from Sandro is:  


You can grab [my updated BizTalk 2013 script][4] over at my BizTalk 2013 GitHub repository.

 [1]: http://sandroaspbiztalkblog.wordpress.com/
 [2]: http://gallery.technet.microsoft.com/PowerShell-to-Configure-0cee83e8
 [3]: http://en.wikipedia.org/wiki/Representational_state_transfer
 [4]: https://github.com/lantrix/BTS/blob/master/build/2013/ConfigureBizTalkServer2013EnvHostAndHostInstances.ps1