---
title: Dealing with corrupt Files and Settings Transfer Wizard (F.A.S.T) image
author: Tech Debug
type: post
date: 2007-04-27T04:06:07+00:00
url: /blog/2007/04/27/windows-files-and-settings-transfer-wizard/
categories:
  - tech

---
Today I was using the [Windows Transfer Wizard][1] to migrate someone&#8217;s old laptop data to their new laptop. This worked perfectly for me the week before on a different system, YET now I got the following error: &#8220;The location you specified does not contain stored information. Please enter a valid folder path into the edit box.&#8221;. The thing is, that I did enter a valid folder. After much looking (well 5 minutes on google) I found the answer at this site [dealing with corrupt Files and Settings Transfer Wizard (F.A.S.T) image][2]  
In my case the files were not corrupt. What had occurred was the new computer had had all the windows critical updates applied, but there was an update for the Transfer Wizard that was not critical, and it had not been applied.  
One quick visit to [Update for Windows XP (KB896344)][3] and my migwiz.exe was at V5.1.2600.2665 on both machines.  
Problem fixed.

 [1]: http://support.microsoft.com/default.aspx?scid=293118
 [2]: http://windowsxp.mvps.org/fast.htm
 [3]: http://www.microsoft.com/downloads/details.aspx?FamilyId=6C2F2318-CBDB-47C0-B7C2-77C4CC37A450&displaylang=en