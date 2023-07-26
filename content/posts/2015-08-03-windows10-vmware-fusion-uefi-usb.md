---
title: Windows 10 UEFI USB Boot in VMWare Fusion 7
author: Tech Debug
type: post
date: 2015-08-03T03:59:10+00:00
url: /blog/2015/08/03/windows10-vmware-fusion-uefi-usb/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:1065;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:1065;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - microsoft
tags:
  - apple
  - boot
  - EFI
  - fusion
  - ISO
  - mac
  - OSX
  - UEFI
  - USB
  - vmware
  - windows10
  - Yosemite

---
You&#8217;ve downloaded your [purchased][1] Windows [10 ISO][2] from Microsoft, and you&#8217;ve managed to [create a bootable UEFI][3] USB stick.  
Now you&#8217;ve decided to run Windows 10 in VMWare Fusion Pro on your Mac. Yet the USB stick can **_NOT_** be booted from.  
There is a solution. VMWare fusion has some (unsupported) EFI options you can enable to effect a USB boot.  
First you&#8217;ll want to create a Windows 10 VM in VMWare Fusion.  
Create a new VM, and select the _more options_ icon:  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1057" src="https://techdebug.com/wp-content/uploads/2015/08/Setup-1-300x249.png" alt="Setup-1" width="300" height="249" srcset="https://techdebug.com/wp-content/uploads/2015/08/Setup-1-300x249.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Setup-1.png 641w" sizes="(max-width: 300px) 100vw, 300px" />  
Select _Create a custom virtual machine_ and select _Continue_:  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1056" src="https://techdebug.com/wp-content/uploads/2015/08/Setup-2-300x249.png" alt="Setup-2" width="300" height="249" srcset="https://techdebug.com/wp-content/uploads/2015/08/Setup-2-300x249.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Setup-2.png 640w" sizes="(max-width: 300px) 100vw, 300px" />  
Select _Windows 10_ as the operating system, and select _Continue_ &#8211; x64 is selected here as I&#8217;m 64 bit all the way:  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1055" src="https://techdebug.com/wp-content/uploads/2015/08/Setup-3-300x249.png" alt="Setup-3" width="300" height="249" srcset="https://techdebug.com/wp-content/uploads/2015/08/Setup-3-300x249.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Setup-3.png 641w" sizes="(max-width: 300px) 100vw, 300px" />  
Leave the virtual disk options and select _Continue_:  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1054" src="https://techdebug.com/wp-content/uploads/2015/08/Setup-4-300x249.png" alt="Setup-4" width="300" height="249" srcset="https://techdebug.com/wp-content/uploads/2015/08/Setup-4-300x249.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Setup-4.png 640w" sizes="(max-width: 300px) 100vw, 300px" />  
On the Summary Screen, you can use the Customize Settings button to change your VM defaults. I updated my RAM to 8GB, my CPU Cores to 2, and changed the VM Disk size to 100GB (60GB may be a bit small for most power users).  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1053" src="https://techdebug.com/wp-content/uploads/2015/08/Setup-Summary-300x249.png" alt="Setup-Summary" width="300" height="249" srcset="https://techdebug.com/wp-content/uploads/2015/08/Setup-Summary-300x249.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Setup-Summary.png 641w" sizes="(max-width: 300px) 100vw, 300px" />  
Before you start the VM; you&#8217;ll need to modify the _vmx_ file directly.

  1. In the Virtual Machine Library, right click on the Windows 10 VM and select _Show in Finder_.
  2. Right click on the vmwarevm container and select _Show Package Contents_
  3. Edit the *.vmx file using your favourite text editor
  4. Append the following options to the configuration to enabled [EFI booting][4]:

`firmware = "efi"<br />
efi.legacyBoot.enabled = "true"`  
[<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1059" src="https://techdebug.com/wp-content/uploads/2015/08/Show-VMX-300x160.png" alt="Show-VMX" width="300" height="160" srcset="https://techdebug.com/wp-content/uploads/2015/08/Show-VMX-300x160.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Show-VMX.png 377w" sizes="(max-width: 300px) 100vw, 300px" />][5]  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1052" src="https://techdebug.com/wp-content/uploads/2015/08/Edit-vmx-300x154.png" alt="Edit-vmx" width="300" height="154" srcset="https://techdebug.com/wp-content/uploads/2015/08/Edit-vmx-300x154.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Edit-vmx.png 521w" sizes="(max-width: 300px) 100vw, 300px" />  
The Legacy boot option allows VMWare to see the USB device in some cases; and was required for me.  
Boot your new VM:  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1051" src="https://techdebug.com/wp-content/uploads/2015/08/Start-VMWare-300x205.png" alt="Start-VMWare" width="300" height="205" srcset="https://techdebug.com/wp-content/uploads/2015/08/Start-VMWare-300x205.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Start-VMWare.png 570w" sizes="(max-width: 300px) 100vw, 300px" />  
You&#8217;ll find that the new EFI boot loaders are picked up, but not yet the USB. Since you couldn&#8217;t attach a USB before starting, you can do it now. Open the VM preferences and attach the USB containing the EFI Boot files:  
[<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1049" src="https://techdebug.com/wp-content/uploads/2015/08/Connect-EFI-USB-300x155.png" alt="Connect-EFI-USB" width="300" height="155" srcset="https://techdebug.com/wp-content/uploads/2015/08/Connect-EFI-USB-300x155.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Connect-EFI-USB.png 481w" sizes="(max-width: 300px) 100vw, 300px" />][6]  
VMWare will now boot into the Windows 10 setup.  
<img decoding="async" loading="lazy" class="aligncenter size-medium wp-image-1050" src="https://techdebug.com/wp-content/uploads/2015/08/Restart-VMWare-Windows10-300x241.png" alt="Restart-VMWare-Windows10" width="300" height="241" srcset="https://techdebug.com/wp-content/uploads/2015/08/Restart-VMWare-Windows10-300x241.png 300w, https://techdebug.com/wp-content/uploads/2015/08/Restart-VMWare-Windows10.png 768w" sizes="(max-width: 300px) 100vw, 300px" />  
Thanks to a post by [A Virtual Den][7] for pointing me in the right direction for the VMX LegacyBoot option!

 [1]: http://www.microsoftstore.com/store/msaus/en_AU/pdp/Windows-10-Pro/productID.320411600
 [2]: https://www.microsoft.com/en-us/software-download/windows10ISO
 [3]: http://www.intowindows.com/create-uefi-bootable-usb-of-windows-10/
 [4]: http://kb.vmware.com/kb/1032867
 [5]: https://techdebug.com/wp-content/uploads/2015/08/Show-VMX.png
 [6]: https://techdebug.com/wp-content/uploads/2015/08/Connect-EFI-USB.png
 [7]: http://avirtualden.blogspot.com.au/2014/04/vmware-fusion-booting-vm-via-usb.html