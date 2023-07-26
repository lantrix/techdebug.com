---
title: Leopard Erase and Install Success – Howto
author: Tech Debug
type: post
date: 2008-02-25T12:00:07+00:00
url: /blog/2008/02/25/leopard-erase-and-install-success-howto/
tags:
  - apple
  - firewire
  - howto
  - leopard
  - mac
  - migration assistant
  - upgrade
categories:
  - mac
  - tech

---
So you want to upgrade your Mac from Tiger (10.4) to Leopard (10.5)? This has probably been written about by every man and his cat, but here is my experience and the optimal installation sequence &#8211; as written by a late-comer to the Leopard gang.[<img decoding="async" style="float: right; margin-left: 20px; margin-right: 20px; margin-bottom: 20px; margin-top: 20px;" src="http://images.apple.com/macosx/images/macosx_index_leopardishere20071026.png" alt="Leopard" />][1]  
<!--more-->

  
Erase and Install is your best bet. Take it from someone whom tried to use the upgrade option and [FAILED][2].

Make a couple of good backups, at least one being an external FIREWIRE (not USB people, FIREWIRE) HDD that [is a clone][3] of your existing tiger boot partition.

**Note:** If you have filevault turned on for any of your accounts you should _turn OFF filevault_ before the upgrade.

The steps then are as simple as this:

  1. Confirm your clone backup works by booting off the external firewire drive &#8211; _I can&#8217;t stress this enough_. Plug in your firewire HDD, power it on, turn on your mac and [hold cmd-option-shift-delete][4] just after the gong sound. This will boot off your backup.
  2. The backup is OK? Good&#8230; shutdown, power off the firewire HDD and unplug it. Power on, holding the C key with your install DVD inserted. This will boot off the DVD (C key is for cdrom booting. A legacy shortcut key, but now commonly known)
  3. Choose the install option &#8211; _Erase and Install_
  4. After the installation is done &#8211; DO NOT use the migration tool to migrate at this time.
  5. Ensure **your username you choose is not the same as any of the old ones**. This is OK, as it can be removed later
  6. Log into your new Leopard, and commence to [download and install][5] the combo update to 10.5.2 (or whatever the latest patch level is)
  7. Once the update is complete and the computer restarted, login, plug in and turn on your Firewire external HDD
  8. Run the [migration assistant as documented by Apple][6]. It will successfully migrate all the chosen accounts, applications and data from your old system that was cloned to the external HDD.

If you have any problems with this all, or need help, you can ask for help in the official [Leopard installation forums][7].  
As a bonus, if you no longer want to clone to the new HDD &#8211; you may format it ONCE you have Leopard working OK, then plug it in and use it as your time-machine backup drive. Bonus.

 [1]: http://www.apple.com/macosx/
 [2]: /blog/2008/02/24/apples-leopard/
 [3]: http://www.bombich.com/software/ccc.html
 [4]: http://davespicks.com/writing/programming/mackeys.html
 [5]: http://www.apple.com/downloads/macosx/apple/macosx_updates/macosx1052comboupdate.html
 [6]: http://docs.info.apple.com/article.html?path=Mac/10.5/en/9032.html
 [7]: http://discussions.apple.com/forum.jspa?forumID=1219&start=0