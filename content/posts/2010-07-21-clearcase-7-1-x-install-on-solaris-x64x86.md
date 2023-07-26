---
title: Clearcase 7.1.x install on Solaris X64/x86
author: Tech Debug
type: post
date: 2010-07-21T07:58:20+00:00
url: /blog/2010/07/21/clearcase-7-1-x-install-on-solaris-x64x86/
amazon-product-excerpt-hook-override:
  - 3
amazon-product-content-hook-override:
  - 2
amazon-product-newwindow:
  - 3
categories:
  - clearcase
  - unix
tags:
  - 7.1
  - clearcase
  - ibm
  - install
  - solaris
  - tips
  - unix
  - x64
  - x86

---
I&#8217;ve been struggling to install the beast that is Clearcase 7.1.1 on a proof of concept server.  
In this case the server is a Solaris 10 64bit install running on VMware Fusion 3.

One of the initial [mistakes I made][1] was to try and run the installation from a network mount. **DON&#8217;T**. Solaris must block the execution of code on some types of removable drives, which in this case was a VMWare Fusion shared folder.

A second thing that is not clear in the README files: Clearcase 7.1.1 _on Solaris x86_ does **[NOT][1]** support the GUI installation. Therefore, for me as much as any readers of this blog, I&#8217;ll document the steps to kick off a fresh/silent installation.

The install will be/have:

  * A local install
  * Clearcase Atria [Licencing][2], local
  * IBM Installation Manager installed first
  * ClearCase installed second

  1. Download your [entitled product][3] for Solaris X86, for CC7.1.1 which is: 
      * CZ9XKML
      * IBM Rational ClearCase V7.1.1 Solaris x86 Platform Edition Multilingual
    
    If you need an evaluation copy, they are [also available][4].</li> 
    
      * Copy the archive to your server, and extract it. I&#8217;ll use _/var/ccinstall_ for my install source, but adjust as required:  
        `<br />
mkdir -p /var/ccinstall<br />
cp -p CZ9XKML.zip /var/ccinstall<br />
cd /var/ccinstall<br />
unzip CZ9XKML.zip<br />
cd disk1<br />
` 
      * Follow the [IBM documented steps][5] for preparing a silent install. For my steps the dir _/var/ccinstall/disk1_ will be _esd\_image\_root_.
      * Kick off the install:  
        `<br />
/var/ccinstall/disk1/InstallerImage_*/install \<br />
--launcher.ini \<br />
/var/ccinstall/disk1/InstallerImage_*/silent-install.ini \<br />
-silent \<br />
-input clearcase_response_sol_x86.xml \<br />
-log silentinstall.log<br />
`  
        If you want to also show the progress, include the switch `-showVerboseProgress`</ol> 
    
    At this point kick back and make a few coffees.  
    Enjoy.

 [1]: http://www.ibm.com/developerworks/forums/thread.jspa?threadID=257695
 [2]: http://www-01.ibm.com/software/rational/support/licensing/
 [3]: https://www-112.ibm.com/software/howtobuy/softwareandservices/
 [4]: https://www14.software.ibm.com/webapp/iwm/web/preLogin.do?source=rational
 [5]: https://publib.boulder.ibm.com/infocenter/cchelp/v7r1m0/index.jsp?topic=/com.ibm.rational.clearcase.cc_ms_install.doc/topics/c_non_gui_inst.htm