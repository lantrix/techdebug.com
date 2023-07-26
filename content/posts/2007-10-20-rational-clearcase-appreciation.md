---
title: Rational Clearcase appreciation
author: Tech Debug
type: post
date: 2007-10-20T01:15:47+00:00
url: /blog/2007/10/20/rational-clearcase-appreciation/
tags:
  - clearcase
  - ibm
  - project managment
  - rational
  - SCM
categories:
  - clearcase

---
I&#8217;m coming to appreciate IBM&#8217;s Rational Clearcase, aside from the price point of course. But work have a license for it, and I have to use it. Don&#8217;t get me wrong, CVS is fantastic for tracking your small projects or larger ones with average complexity. I still use CVS for my own code, BUT clearcase has these features built in that you just start to take for granted. Here is a list of the ones I think make it a cut above CVS on a time intensive and complex project:

  * Editing commit comments from the GUI or cmd line
  * Triggers &#8211; including haveing pre and post operation triggers &#8211; some of mine are in perl!
  * Labels vs CVS tags
  * Element based branching based upon a view configspec
  * Clear Merge Manager &#8211; This one is a lifesaver!
  * renaming elements, specifically directories from GUI or cmd line

You can see from my short list that there are some things there that are powerful and make life very easy in a multi stream multi branch project management environment.  
A case in point: I spent the last 3 hours baselining our Development, and testing branches &#8211; being 3 branches. We have started a new release cycle after our product has gone live in production, but there are still release fixes and defects being resolved that will get applied to production at a later date (2nd drop).  
By baselining and labelling my code in these branches, I can easily track code changes across both the new development cycles and the concurrent release fixes.

On the whole, after half a year using Rational Clearcase, I can say the experience &#8211; despite the initial _VERY LARGE_ learning curve &#8211; has been positive.