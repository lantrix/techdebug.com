---
title: Clearcase Branches Solved?
author: Tech Debug
type: post
date: 2007-08-10T09:23:35+00:00
url: /blog/2007/08/11/clearcase-branches-solved/
tags:
  - branch
  - clearcase
  - cvs
  - ibm
  - rational
  - SCM
categories:
  - apps

---
I think I may have stumbled upon the answer. I&#8217;m so set in my CVS ways that I though the best thing was to branch the entire top level folder &#8211; recursively. What I really was after was a way of setting the configspec on the NEW view I create for the new branch, and making it show code that is labeled with a particcular label, then when it is checked out and in, a new revision exists on the new branch. The advantage here, is that my new view shows exactly what I need without the need for checking out a version of every file in that view.

[This post over at the IBM Rational Clearcase forums][1] describes EXACTLY what I was after, and explained it in the precise terms I needed. I&#8217;m thinking differently now, and if it works as I intend, then I shall write further about this adventure into [SCM][2].

 [1]: http://www.ibm.com/developerworks/forums/dw_thread.jsp?message=13939273&cat=24&thread=158366&treeDisplayType=threadmode1&forum=333#13939273 "developerWorks : : Forums : Help"
 [2]: http://en.wikipedia.org/wiki/Software_configuration_management "Software configuration management - Wikipedia, the free encyclopedia"