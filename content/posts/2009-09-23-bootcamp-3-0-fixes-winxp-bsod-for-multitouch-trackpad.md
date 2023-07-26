---
title: Bootcamp 3.0 fixes WinXP BSOD for Multitouch Trackpad
author: Tech Debug
type: post
date: 2009-09-23T02:45:49+00:00
url: /blog/2009/09/23/bootcamp-3-0-fixes-winxp-bsod-for-multitouch-trackpad/
categories:
  - apple
  - microsoft
  - os
tags:
  - 3.0
  - applemtp.sys
  - bootcamp
  - BSOD
  - driver
  - snow leopard

---
Apple released Bootcamp 2.1 with OS 10.5, which allows you to dual boot to Windows XP/Vista on your Mac.  
Subsequenet to that release, there was a driver [update][1] for the Multitouch trackpad which was suppose to improve souble tapping, etc. However it [caused][2] a Blue Screen of Death (BSOD) the moment you double tapped, courtesy of [applemtp.sys][3].

Many people sent suggestions to Apple to fix this, but it seemed to be falling on deaf ears.

Little did we know that Apple were releasing a new version of the touchpad driver included with Bootcamp 3.0 on the Snow Leopard install DVD.

I&#8217;ve updated my Bootcamp to 3.0, and indeed the _applemtp.sys_ driver version has increased to **2.1.2.112**. The [FAQ][4] for the Snow Leopard update states that Bootcamp 3.0 has:

> &#8220;Improved tap-to-click support &#8211; The ability to tap the track pad to click the mouse button is now supported on all Mac portables that run Boot Camp.&#8221;

In my tests, so far, there has been no more crashes. I get to use double finger right click tap, and the track pad responsiveness that I got in the older buggy driver is back as well.

Thanks Apple. No more BSOD.

 [1]: http://support.apple.com/downloads/Multi_Touch_Trackpad_Update_1_1_for_Windows
 [2]: http://discussions.apple.com/message.jspa?messageID=10257541
 [3]: http://discussions.apple.com/message.jspa?messageID=10257454
 [4]: http://support.apple.com/kb/HT3777