---
title: 'Powershell: AWS and IAM policy retrieval'
author: Tech Debug
type: post
date: 2014-08-05T07:19:43+00:00
url: /blog/2014/08/05/powershell-aws-and-iam-policy-retrieval/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:993;}'
wordtwit_post_info:
  - 'O:8:"stdClass":14:{s:6:"manual";b:1;s:11:"tweet_times";i:1;s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.6";s:14:"tweet_template";s:83:"Powershell: AWS and IAM policy retrieval by @lantrix - [link] #AWS #powershell #IAM";s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:993;}s:9:"hash_tags";a:2:{i:0;s:3:"AWS";i:1;s:10:"powershell";}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}s:4:"text";s:105:"Powershell: AWS and IAM policy retrieval by @lantrix - https://techdebug.com/?p=989 #AWS #powershell #IAM";}'
categories:
  - AWS
tags:
  - administration
  - Amazon
  - AWS
  - GroupName
  - groups
  - IAM
  - policies
  - PolicyDocument
  - PolicyName
  - powershell
  - PS1
  - windows

---
I&#8217;ve recently been working more day to day on Amazon Web Services, and I found it a little unwieldy to navigate around policy documents assigned to IAM groups.

Sometimes you just want to have a local copy of the policies to edit/play with/look at.

Therefore, I came up with a quick script to solve this. Enjoy&#8230;  
Of course, the [AWS SDK for Powershell][1] is required.

 [1]: https://aws.amazon.com/powershell/