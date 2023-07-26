---
title: 'The tale of BizTalk & BPMS'
author: Tech Debug
type: post
date: 2011-09-02T09:41:28+00:00
url: /blog/2011/09/02/the-tale-of-biztalk-bpms/
wordtwit_post_info:
  - 'O:8:"stdClass":14:{s:6:"manual";s:0:"";s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";s:2:"60";s:7:"version";s:5:"3.1.3";s:14:"tweet_template";s:0:"";s:6:"status";s:1:"2";s:6:"result";a:0:{}s:13:"tweet_counter";s:1:"4";s:13:"tweet_log_ids";a:3:{i:0;s:3:"835";i:1;s:3:"836";i:2;s:3:"837";}s:9:"hash_tags";a:4:{i:0;s:7:"biztalk";i:1;s:4:"2010";i:2;s:3:"ESB";i:3;s:4:"BPMS";}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}s:4:"text";s:65:"The tale of BizTalk &amp; BPMS by @lantrix - http://bit.ly/n0rl7S";}'
categories:
  - Musings
tags:
  - 2010
  - B2B
  - BizTalk
  - BPMS
  - Business
  - ESB
  - IT

---
It&#8217;s been a long time since I&#8217;ve posted anything, so here goes. I&#8217;m currently working for a client who wants BizTalk installed as an ESB. They don&#8217;t know why they want it, they just know that they want it.

Since they are a Microsoft shop it&#8217;s an assumption on their behalf, but a good one in this case. They are dealing with external agencies who will submit data on a daily basis to be consumed within the organisation. This is BizTalk&#8217;s bread and butter especially in the [B2B][1] space. Unfortunately at the moment the client will be accepting data from business partners via manual submission using web forms on Sharepoint 2010.

At least once we get BizTalk in, we can show them how then next phase of operations can automate a number of external business interactions.

One of the other benefits of BizTalk, acting as an Enterprise Service Bus, is for facilitating communications between isolated systems and applications &#8211; allowing one to avoid point to point design when applications integrate.

So the client is, without understanding it, thinking of implementing the start of Service Orientated Architecture.

The only thing that&#8217;s disappointing is this: they understand that BizTalk can orchestrate Business processes across systems, but they still don&#8217;t think of their IT system(s) as one entire [Business Process Management System][2] (BPMS). They have 5 standalone applications at launch, and are aiming to bring on board and integrate up to 15 separate business applications &#8211; most of which will be new.

They talk ITIL, Agile, methodology, and &#8220;Frameworks&#8221; &#8211; but still practice waterfall project management and don&#8217;t understand the [lifecycle][3] of a true BPMS.

In the end IT delivers not for themselves, but for the Business. The core functions of the Business is what IT is there to facilitate and support. Business and IT departments need to be engaged and working to together right from the start, hopefully with key minds that are visionary enough to deliver a BPMS to support the process of the Business!

 [1]: http://en.wikipedia.org/wiki/B2B
 [2]: http://en.wikipedia.org/wiki/BPMS
 [3]: http://en.wikipedia.org/wiki/BPMS#BPM_life-cycle