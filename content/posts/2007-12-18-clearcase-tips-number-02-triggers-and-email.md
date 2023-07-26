---
title: Clearcase Tips Number 02 – Triggers and email
author: Tech Debug
type: post
date: 2007-12-17T22:00:35+00:00
url: /blog/2007/12/18/clearcase-tips-number-02-triggers-and-email/
tags:
  - brtype
  - clearcase
  - shell script
  - trigger
  - unix
categories:
  - clearcase
  - unix

---
I was looking for a simple way to have someone emailed when an event occurred in Rational Clearcase, like a new branch type being created. If you run Clearcase on UNIX (i.e. Solaris or similar) you can whip up a simple shell script and create your trigger. I will assume you have sendmail or similar already configured on your host so that mail utilities can send smtp mail

_Lets have a go at it._

Write a shell script that uses mailx to send a message with some Clearcase trigger variables embedded in it, something like this:  
``<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> Comma delimited email list of mail recipients<br />
adminmail="youraddress@your.domain.com"<br />
<a href="http://search.twitter.com/search?q=%23This" class="tweet-hashtag">#This</a> gets the host name<br />
host=`uname -a |awk '{print $2}'`</p>
<p><a href="http://search.twitter.com/search?q=%23Begin" class="tweet-hashtag">#Begin</a> send of message<br />
echo "\<br />
Creation of brtype \"$CLEARCASE_BRTYPE\"<br />
by: $CLEARCASE_USER<br />
comment: $CLEARCASE_COMMENT" \<br />
| /usr/bin/mailx -s "[$host:CLEARCASE] New branchtype $CLEARCASE_BRTYPE created"<br />
``  
You can download this [mail\_new\_brtype.sh][1] if you are in a rush.

In this script you will see a number of variables starting with $CLEARCASE. These variables will be populated as environment variables when a trigger event occurs and launches the shell script.

The script should be saved somewhere it can be run on the UNIX server hosting the VOB, so when Clearcase triggers it can run the script. An appropriate location would be in the home directory of the VOB owner, for example:  
`/home/ccadmin/ccscripts/mail_new_brtype.sh`

One you have saved the script, you need to actually make the trigger in Clearcase. Consider the following on creating this trigger type

  * We need the trigger to run after the event, this is what is known as a &#8220;Post Operation&#8221;
  * We want the trigger to be enacted after a new type is made, of type branchtype.
  * We want the trigger to execute our shell script on the event occurring

You can research these options by viewing the man page of the command used to make a new trigger type:  
`cleartool man mktrtype`

Once you have had a read of the man page, you should see some examples and options that can be used. Have a go at running the command yourself. This is what I came up with and should cover all our considerations:  
`cleartool mktrtype -c "Trigger to email cfgmgr on new brtype creation" -type -postop mktype -brtype -all -exec /home/ccadmin/ccscripts/mail_new_brtype.sh new_branch_trigger`  
My example shown here is relevant to Clearcase V6, so YMMV.

Once that has been run, you can see your new trigger listed in the trigger type list:  
`cleartool lstype -kind trtype<br />
18-Dec.10:27   ccadmin     trigger type "new_branch_trigger"<br />
  "Trigger to email cfgmgr on new brtype creation"<br />
` 

Next time a user creates a branch type, you will receive an email with the branch type name, branch type comment and whom created it!

Look for more upcoming tips; including how to make a trigger use a perl script to validate label names.

 [1]: https://techdebug.com/wp-content/uploads/2007/12/mail_new_brtype.sh "mail_new_brtype.sh"