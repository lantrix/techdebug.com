---
title: Using your MacBookPro to PXEBoot OpenBSD
author: Tech Debug
type: post
date: 2008-12-07T16:07:05+00:00
url: /blog/2008/12/08/using-your-macbookpro-to-pxeboot-openbsd/
categories:
  - mac
  - openbsd
  - tech
  - unix
tags:
  - dhcp
  - mac
  - openbsd
  - pxe
  - tftp

---
**This post does not show a successful outcome in case that&#8217;s what you where hoping for.**

I was trying to get OpenBSD bootstrapped using the PXEBoot NIC in a server. I decided to use my Mac which has tftp and bootpd installed. This post is quite in depth and technical so if you are game then read on.  
<!--more-->

The quick and short of it was I turned it all on, and copied my pxeboot image, like this from the Terminal:

`sudo apachectl start<br />
sudo service tftp start<br />
sudo cp /Library/WebServer/Documents/pub/OpenBSD/4.4/i386/pxeboot  /private/tftpboot/<br />
` 

Then I neeed to setup the bootp server which comes with Internet Sharing. The idea was to add the pxeboot filename needed by OpenBSD (the file copied to tftpboot above) to the bootp (AKA dhcp) server options. The important file here is _/etc/bootpd.plist_. If this file doesn&#8217;t exist when Internet Sharing starts then bootpd will create it, removing it when it stops. But courtesy of [Jules.FM][1] &#8220;if the file already exists when it starts, the Mac will leave it alone and not overwrite or remove it&#8221;. So to add new dhcp options you perform these steps:

  1. Start Internet Sharing
  2. Copy the file somewhere safe: &#8220;`cp /etc/bootpd.plist /tmp/`&#8220;
  3. Stop Internet Sharing
  4. Edit /tmp/bootpd.plist
  5. Add your required options
  6. Copy the file back in place: &#8220;`sudo cp /tmp/bootpd.plist /etc/`&#8220;
  7. Start Internet Sharing

Since the Mac bootpd.plist file has no option for &#8220;filename&#8221; [documented][2] and since there appears to be a [bug in the bootpd implementation][3] with respect to supplying dhcp_options I added these _data_ options to the _bootpd.plist_ file:  
`<br />
<key>dhcp_option_66</key><br />
<data><br />
wKgCAQ==<br />
</data><br />
<key>dhcp_option_67</key><br />
<data><br />
cHhlYm9vdA==<br />
</data><br />
<key>dhcp_option_93</key><br />
<data><br />
AA==<br />
</data><br />
` 

In [RFC2132][4] (Paragraphs 9.4 and 9.5) it specifies that options 66 and 67 are for the tftp server and boot filename. However the bootpd bug meant I had to [encode][5] the string &#8220;_pxeboot_&#8221; to hexadecimal &#8220;_0x707865626F6F74_&#8221; then Base64 [encode][6] it being &#8220;_cHhlYm9vdA==_&#8221; and that is way too time consuming to stuff around and try something else everytime the tftp file retrieval fails.

Don&#8217;t try using the dhcp\_option\_66 I had either as it is an encoded IP of my tftp server, not yours.

I got it all going, and the MacBookPro worked as planned, but the bootp server offered a filename of &#8220;_pxeboot_&#8221; and the silly Intel 10/100 card decided to fail due to missing files on the tftp server. Many hours later and I figured I should use a network sniffer instead of trying to turn on tftpd logging.

A packet dump showed \377 or 0xff being appended to the filename by the boot client (intel Nic on remote server) when using tftp to request the file. This made the filename &#8220;_pxeboot_&#8221; look like &#8220;_pxeboot\377_&#8221; in [Wireshark&#8217;s][7] view of the packet, as [discussed here][8] by other pioneers in netbooting.

If I get a full working implementation of dhcpd/tftp/pxe using the Mac &#8211; and actually working independent of the intel nic problem on the server, I&#8217;ll update this entry or write a complete run down.

**Don&#8217;t hold your breath though**. I rebuilt the OpenBSD server using bsd.rd (being a ramdisk installation) so my need is no longer a driver.

 [1]: http://www.jules.fm/Logbook/files/mac_squeezebox_connection_sharing.html
 [2]: http://developer.apple.com/documentation/Darwin/Reference/Manpages/man8/bootpd.8.html
 [3]: http://discussions.apple.com/thread.jspa?messageID=6021307&#6021307
 [4]: http://www.networksorcery.com/enp/rfc/rfc2132.txt
 [5]: http://www.vortex.prodigynet.co.uk/misc/ascii_conv.html
 [6]: http://hogehoge.tk/tool-i/
 [7]: http://www.wireshark.org/
 [8]: http://osdir.com/ml/hardware.soekris.technical/2002-06/msg00016.html