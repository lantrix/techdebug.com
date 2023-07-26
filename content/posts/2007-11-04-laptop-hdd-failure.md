---
title: Laptop HDD failure
author: Tech Debug
type: post
date: 2007-11-04T06:45:44+00:00
url: /blog/2007/11/04/laptop-hdd-failure/
tags:
  - backup
  - carbon copy cloner
  - data recovery
  - data rescue II
  - failure
  - hdd
  - mac
categories:
  - apps
  - mac
  - os
  - tech

---
<p style="float: right; margin-bottom: 10px; margin-left: 10px">
  <img src='https://techdebug.com/wp-content/uploads/2007/11/drescue.jpg' alt='Data Rescue II' />
</p>

Last Friday at work my Mac (OS X 10.4) laptop HDD died. After the purchase of an extra external HDD and some custom recovery software, [Data Rescue II][1], I tried to recover as much as I could. The bad news is the Hard drive had not just gotten corrupted, but failed. After an attempt to clone it to a second drive for analysis, and during my recovery attempt it developed the click of death. Now it no longer appears in the Hardware list on Data Rescue.

However, I was lucky on two counts:

  * I sync my entire iTunes library music+photos to my ipod _WITH_ the full resolution photo option enabled
  * I recently started using [Carbon Copy cloner][2] to sync to an external Firewire drive

<p style="float: left; margin-bottom: 10px; margin-right: 10px">
  <img src='https://techdebug.com/wp-content/uploads/2007/11/ccc.gif' alt='CCC' />
</p>

The external HDD was bootable and I got my system back online with it, albeit 4 weeks old. Carbon Copy Cloner had cloned all the data, and made the drive bootable as requested. **Note: using a firewire HDD was required to make it bootable**. I&#8217;m not sure if this is still valid with newer intel Macs.

The iTunes sync alone saved my music purchases and iPhotos from the last 4 weeks. I will be sure to commence a more thorough backup regime, and I will be using my 2 HDD&#8217;s now as Primary and Secondary backups &#8211; one being offsite (at work). Its not worth the hassle of having anything less.

Are you lucky enought to have upgraded to OSX 10.5 already? You might be thinking you could use [Time Machine][3], but it wont produce an instantly usable bootable backup in the case of complete HDD failure. I think Time Machine will complement any use of CCC.

I did lose 4 weeks of Mail, Documents, and a new CVS repository I setup &#8211; but this is small compared to what could have been lost.

The lesson learnt is that anyone with a mac should buy an external firewire hard drive of the same size or greater than their &#8220;Macintosh HD&#8221;; [Clone it with CCC][4]; and reclone it regularly (synchronise option). This will prevent the heartache of loosing all your photos, music and data in this electronic world.

 [1]: http://www.prosofteng.com/products/data_rescue.php
 [2]: http://www.bombich.com
 [3]: http://www.apple.com/macosx/features/timemachine.html
 [4]: http://www.bombich.com/software/ccc.html