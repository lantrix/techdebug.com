---
title: An AppleScript to sync creation and modification dates
author: Tech Debug
type: post
date: 2007-11-12T13:39:16+00:00
url: /blog/2007/11/12/an-applescript-to-sync-creation-and-modification-dates/
tags:
  - applescript
  - date
  - files
  - mac
  - macosxhints
DiggUrl:
  - http://digg.com/programming/An_Apple_Script_to_set_modification_date_to_creation_date
categories:
  - apps
  - mac

---
After I read [this macosxhints.com post][1], I decided to have a go at something slightly different.

The orginal hint showed how to set up an AppleScript droplet to modify the creation date of a file. But what if you want to sync the modified date and Creation dates instead? This script has been created to do just that. It has evolved from one Daniel A. Shockley [provided in a macosxhints comment][2] to the previous hint, and has been extended to fit this purpose.

To set your files modified date to be the same as the creation date, use the AppleScript as a droplet application. Copy and paste the text into a new script in Script Editor, and then save it as an application. Run the application to bring up a requester, or drop your files (not folders) on the application directly.

**[Download the Applescript][3] (Note: not tested on Leopard/10.5.x)**

**Note:** a reader of my post [suggested a simpler date change routine][4].

 [1]: http://www.macosxhints.com/article.php?story=20060703160750583
 [2]: http://www.macosxhints.com/comment.php?mode=view&cid=76919
 [3]: https://techdebug.com/wp-content/uploads/2007/11/setmodifydate.scpt "setmodifydate.scpt"
 [4]: http://www.macosxhints.com/comment.php?mode=view&cid=90120