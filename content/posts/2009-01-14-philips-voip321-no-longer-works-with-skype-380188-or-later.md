---
title: Philips VOIP321 no longer works with Skype 3.8.0.188 or later
author: Tech Debug
type: post
date: 2009-01-13T13:40:46+00:00
url: /blog/2009/01/14/philips-voip321-no-longer-works-with-skype-380188-or-later/
categories:
  - hardware
tags:
  - beta
  - broken
  - bug
  - eol
  - philips
  - phone
  - skype
  - voip
  - voip321

---
I&#8217;ve been having a conversation on a Skype bug reporting forum, and it came to a conclusion that the [Philips VOIP321 Skype Phone][1] is just not worth purchasing. I&#8217;m an owner of a Philips VOIP321 phone, and until December 2008 it worked fine. However the latest Skype update has put an end to product useability.

**Since Skype Version 3.8.0.188 (Release date: November 19, 2008) and all later versions (including Skype 4 Betas as at Jan. 2009) the software Philips supply no longer works with Skype and the VOIP321 phone.**

The latest VOIP321 <a href="http://tinyurl.com/6b2xrp" rel="nofollow">driver from their website</a> suffers the same issue, even though it states &#8220;The VOIP321 USB Phone Driver V 3.8.3 which can be downloaded from Philips web site is compatible with Skype software version from V2.0.0.x until V3.8.0.x&#8221;. This is **_plainly no longer correct_** with the latest stable release of Skype, V3.8.0.188.

Skype developers are <a href="https://developer.skype.com/jira/browse/SPA-599" rel="nofollow">unable to do anything about it</a> as they see it being a Philips driver problem. Phillips wont update their driver (Quoting support staff &#8220;&#8230; no more development/fixes are being incorporated into the VOIP321.EXE file&#8221;).

**The solution to getting this beast working again:**

  * Uninstall Skype 3.8.0.188 (or later non-working version)
  * Visit the [Old Apps website][2] where you can (without support from Skype) download a previous version and use it.
  * I found that _Skype <del datetime="2009-01-17T02:34:34+00:00">3.8.0.154</del> 3.8.0.139 worked fine for me with the VOIP321 hardware under Windows XP_
  * Reinstall the older version.
  * Launch the newly installed older version of Skype
  * Remove the VOIP321.exe application from the Skype menu: Tools > Options > Advanced > Advanced Settings > Manage other programs Access to Skype
  * Reboot your Windows Computer

If you don&#8217;t own one of these yet, don&#8217;t waste your time on Philips Skype phone devices. Their driver support is lacking when Skype is updated and they [EOL][3] their product too soon. You buy a product for a few hundred dollars and it becomes useless 12 months later. Phillips would probably rather sell you a newer bit of hardware.

Should they update their driver at this point I will be the first to commend them. I forgot to mention: Phillips Skype phones (where your PC is required) are Windows Only. _No Mac or Linux support or drivers are offered_.

My next purchase will be a wifi or wired ethernet Skype phone, and not Philips.

 [1]: http://www.consumer.philips.com/consumer/en/au/consumer/cc/_productid_VOIP3211S_79_AU_CONSUMER/Internet-DECT-phone+VOIP3211S-79
 [2]: http://www.oldapps.com/skype.htm
 [3]: http://en.wikipedia.org/wiki/End-of-life_(product)