---
title: Clearcase Element Permissions on Unix
author: Tech Debug
type: post
date: 2007-08-14T06:18:44+00:00
url: /blog/2007/08/14/clearcase-element-permissions-on-unix/
categories:
  - clearcase
  - unix

---
I was wondering how to set permissions on an element in clearcase under unix. You can&#8217;t just use your normal chmod. After reading [&#8220;Phil for Humanity&#8221;][1] I had the answer:  
`cleartool protect -chmod 550 myscript.sh`  
Quite simple after all. Your file, in this case myscript.sh, will now have the permissions you want.  
Remember however, if you try to set write permissions on a file element, it wont set. The clearcase man page for protect advises that write perms are ignored &#8211; instead to obtain write permission to a file element, it must be checked out.  
In the case of a directory element the write permission allows you to create view-private files.  
Don&#8217;t forget the umask should be set correctly before you start creating files!

 [1]: http://www.philforhumanity.com/ClearCase_Support_5.html "ClearCase Support: Changing File Permissions &laquo; Phil for Humanity"