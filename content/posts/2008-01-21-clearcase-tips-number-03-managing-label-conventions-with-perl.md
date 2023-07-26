---
title: Clearcase Tips Number 03 – managing label conventions with perl
author: Tech Debug
type: post
date: 2008-01-21T12:23:19+00:00
url: /blog/2008/01/21/clearcase-tips-number-03-managing-label-conventions-with-perl/
tags:
  - clearcase
  - lbtype
  - perl
  - script
  - solaris
  - unix
categories:
  - clearcase
  - unix

---
I [previously showed you][1] how to use a shell script with Rational Clearcase, to alert you when a new branch type was created.

In this post, I will show you how to use a Perl script to enforce Clearcase labeling conventions. [<img src='https://techdebug.com/wp-content/uploads/2008/01/perl_republic.png' style="float: right; margin-top: 5px; margin-bottom: 5px; margin-left: 10px" alt='Perl Logo' />][2]This example is directed toward Clearcase on UNIX (i.e. Solaris or similar) and assumes you have Perl installed, working and have a basic knowledge of how to program in Perl. It is a reworked version of the windows script [supplied by IBM on Developerworks][3].

This is a long post, but a good one if you are a new clearcase admin who needs to enforce label names.

<!--more-->

_Lets get into it._

For this script we would like to allow only project defined labels. This list shows examples which we will aim to enforce:

  * A user label: USER\_ASMITH\_NEW
  * A defect label: DEFECT_12345
  * A Project label: PROJECTA_PRERELEASE
  * Another Project label: PROJECTB_FINAL
  * A release label: REL_1.0
  * A baseline label: BASELINE_STRATA

In all examples you actually want the users to define some part of the label, so for our script we will enforce only the first part up to and including the underscore; i.e. the part in italics _ENFORCE__USERINFO. You can change this as needed for your project.

Initially you will need to write a perl script that can be used in a trigger event. The perl script will take the requested label (lbtype) from the clearcase label creation event, and then process that label for you. You can start the script be choosing some preferred label prefixes for your projects (as per our example list of labels above):  
`<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a><br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> Configuration Variables<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a><br />
my $USERPREFIX = 'USER';<br />
my $DEFECTPREFIX = 'DEFECT';<br />
my $PROJ1_PREFIX = 'PROJECTA';<br />
my $PROJ2_PREFIX = 'PROJECTB';<br />
my $REL_PREFIX = 'REL';<br />
my $BASEPREFIX = 'BASELINE';<br />
`  
These variables are chosen to cover potential labels for users, defects, projects, releases and baselines. As already mentioned, change them to suit your needs.

After you have your variables set, put in place a subroutine to gather the current Unix userID. This will prevent a user from creating user labels with other users account names in it. This subroutine will get called later when you break apart the label with [regex][4].  
``<br />
sub checkUserName {<br />
  my $user = shift(@_);</p>
<p>  my $currentUser = uc($ENV{CLEARCASE_USER});</p>
<p> if ($user !~ m/^($currentUser)/) {<br />
    `clearprompt proceed -mask proceed -type error -prompt \"Can't create label for this user\"`;<br />
    exit 1;<br />
  }<br />
  exit 0;<br />
}<br />
`` 

Next you need to gather the actual lbtype requested from the operation. This script will be run as a pre-operation script, unlike [tip number 02][1] which was a post operation script. The idea is to check the label BEFORE it is actually created.  
``<br />
{<br />
  my $label = $ENV{CLEARCASE_LBTYPE};</p>
<p>  <a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> check, if label is in uppercase format<br />
  if ($label ne uc($label)) {<br />
    `clearprompt proceed -mask proceed -type error -prompt \"CC Error: Label not in uppercase\"`;<br />
    exit 1;<br />
  }<br />
``  
Additionally with this code you are enforcing a policy of uppercase labels. If the label is not all uppercase, the script will exit with a return code of 1, causing the label creation to fail with the prompt shown in the script.

It is good practice to have your labels all uppercase to prevent them from being confused with branch type names (which normally you would have all in lowercase). 

Next you can breakdown the label using [regex][4] and use some conditional checks to compare the label against all the allowed prefixes. As long as the prefix is valid, we don&#8217;t care what comes after it. The one exception is the chosen user label convention. It will require the user prefix, followed by a username that must match the current unix login name.  
`<br />
  <a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> decompose label<br />
  if ($label =~ m/^($USERPREFIX)_(.*)_(.*)$/) {<br />
    &checkUserName($2);<br />
  } elsif ($label =~ m/^($DEFECTPREFIX)_(.*)$/) {<br />
    exit 0;<br />
  } elsif ($label =~ m/^($PROJ1_PREFIX)_(.*)$/) {<br />
    exit 0;<br />
  } elsif ($label =~ m/^($PROJ2_PREFIX)_(.*)$/) {<br />
    exit 0;<br />
  } elsif ($label =~ m/^($REL_PREFIX)_(.*)$/) {<br />
    exit 0;<br />
  } elsif ($label =~ m/^($BASEPREFIX)_(.*)$/) {<br />
    exit 0;<br />
`  
Note that in all cases where you get a successful match, the script will exit with a return code zero, allowing the label creation to continue. Feel free to modify the [regex][4] and configuration variables to test against suffixes or the entire label type.

Lastly should the new label not match any of your regex checks then the script will exit with a return code of one. This will abort the creation of the invalid label type.  
``<br />
  } else {<br />
    <a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> no valid prefix found<br />
    `clearprompt proceed -mask proceed -type error -prompt \"CC Error: No valid Label specified - please read project guidelines\"`;<br />
    exit 1;<br />
  }<br />
}<br />
``  
Don&#8217;t forget to close off that last curly bracket we opened earlier. 

You can download the [whole script][5] if you are in a rush. 

In this script you have seen a number of variables starting with $CLEARCASE. These variables will be populated as environment variables when the label creation trigger event occurs and launches the perl script.

The script should be saved somewhere it can be run on the UNIX server hosting the [VOB][6], so when Clearcase triggers it can run the script. An appropriate location would be in the home directory of the VOB owner, for example:  
`/home/ccadmin/ccscripts/test_label_name.pl`

One you have saved the script, you need to actually make the trigger in Clearcase. Consider the following on creating this trigger type:

  * We need the trigger to run before the event completes, this is what is known as a &#8220;Pre Operation&#8221;
  * We want the trigger to be enacted before a new type is made, of type labeltype.
  * We want the trigger to execute our perl script on the event occurring

You can research these options by viewing the man page of the command used to make a new trigger type:  
`cleartool man mktrtype`  
Once you have read the man page, you should see some examples and options that can be used. Have a go at running the command yourself.

This is how I created the trigger to cover all our considerations:  
`cleartool mktrtype -c "Trigger to validate new labels on lbtype creation" -type -preop mktype \<br />
-lbtype -all -exec /home/ccadmin/ccscripts/test_label_name.pl new_label_trigger`  
My example shown here is relevant to Clearcase V6, so [YMMV][7].

Once that has been run, you can see your new trigger listed in the trigger type list:  
`cleartool lstype -kind trtype<br />
21-Jan.09:21   ccadmin     trigger type "new_label_trigger"<br />
  "Trigger to validate new labels on lbtype creation"<br />
` 

Next time a user creates a label type, they will either have success if they follow the guidlines you have communicated to them, or they will get an error message explaining why the label type failed.

See if you can tie this in with the previous tip, so that you get an email when a new lbtype is created. Over and out.

 [1]: https://techdebug.com/blog/2007/12/18/clearcase-tips-number-02-triggers-and-email/
 [2]: http://www.perl.org/ "Perl"
 [3]: http://www.ibm.com/developerworks/rational/library/4311.html
 [4]: http://en.wikipedia.org/wiki/Regex
 [5]: https://techdebug.com/wp-content/uploads/2008/01/test_label_name.pl "Test Label Name"
 [6]: http://en.wikipedia.org/wiki/Rational_ClearCase#Views
 [7]: http://www.computerhope.com/jargon/y/ymmv.htm