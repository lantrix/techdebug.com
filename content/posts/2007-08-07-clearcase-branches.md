---
title: Clearcase Branches
author: Tech Debug
type: post
date: 2007-08-07T13:56:28+00:00
url: /blog/2007/08/07/clearcase-branches/
tags:
  - branch
  - clearcase
  - cvs
  - ibm
  - rational
  - SCM
categories:
  - unix

---
I&#8217;m so used to making branches in CVS.  
`<br />
cvs tag -b system_test<br />
`  
As the CVS doco states simply, &#8220;This splits off a branch based on the current revisions in the working copy&#8221;, and these revisions will get assigned the branch name, in this case \`system_test&#8217;. Simple, powerful enough and quick!

But Rational Clearcase is a different beast as I learn it. You have to make your branchtype.  
`cleartool mkbr system_test`  
All good so far.

Next I must merge stuff from the current mainline to my new branch, BUT I can only do it a file at a time or using findmerge??? When I do a dry run, the element does not exist in the new branch though so it says it will skip everything&#8230; Hmmm  
On top of all this one must not forget to set your view configspec set to show this branch! (like a CVS Checkout with your branch tag being sticky).

No wonder people prefer CVS. Clearcase IS powerful once you know it, but the learning curve is huge.

So asking for help &#8211; if anyone actually reads this &#8211; any quick ways to branch the /main/LATEST into my new branch?