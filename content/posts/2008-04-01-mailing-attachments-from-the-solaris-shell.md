---
title: Mailing attachments from the Solaris Shell
author: Tech Debug
type: post
date: 2008-04-01T07:00:55+00:00
url: /blog/2008/04/01/mailing-attachments-from-the-solaris-shell/
tags:
  - attachments
  - mail
  - mailx
  - solaris
  - unix
  - uuencode
DiggUrl:
  - http://digg.com/linux_unix/Mailing_attachments_from_the_Solaris_Shell
categories:
  - unix

---
I needed a quick way to send some files from the command line when logged into a Solaris server via ssh.  
This assumes the server is already configured to deliver your smtp mail. I also used mailx for the sending client.  
Here is how I did it, for your geeky reference.

First write your message:  
`cat << EOF > /tmp/mailmsg<br />
Hi this is a message<br />
And this is the second line<br />
EOF`

Then populate your recipient list, comma delimited as per the [mailx(1) man page:][1]  
`cat << EOF > /tmp/mailrecipients<br />
john.doe@nodomain.com.it,jack.black@someplace.co.za<br />
EOF`

  * Then the actual command that will send your mail
. You need to uuencode your binary attachments, and you can send as many as you need.  
`` (cat /tmp/mailmsg ; uuencode /path/to/file.txt file.txt ; uuencode /location/of/otherfile otherfile) | mailx -s 'Subject' -r myemail@some.place.mx `cat /tmp/mailrecipients` ``

You need to specify each file name twice, once for source file to encode, and once for the encoded file name; as per the [uuencode(1C) man page][2]. If you are sending from some local account on the server, the -r switch allows you to specify an alternate return address for the recipients (in other words your normal email address).

**PS:** watch for the quotes and backticks. Dont mix them up!

Hope this helps you out someday.

 [1]: http://docs.sun.com/app/docs/doc/816-0210/6m6nb7mej?a=view
 [2]: http://docs.sun.com/app/docs/doc/816-0210/6m6nb7mop?a=view