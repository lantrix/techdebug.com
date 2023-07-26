---
title: Packer vmware-iso builder on ESXi without DHCP
author: Tech Debug
type: post
date: 2015-09-16T03:14:36+00:00
url: /blog/2015/09/16/packer-vmware-iso-builder-esxi-without-dhcp/
wordtwit_posted_tweets:
  - 'a:2:{i:0;i:1086;i:1;i:1087;}'
wordtwit_post_info:
  - 'O:8:"stdClass":14:{s:6:"manual";b:1;s:11:"tweet_times";i:1;s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";s:63:"Packer vmware-iso build on ESXi sans DHCP by @lantrix - [link] ";s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:3;s:13:"tweet_log_ids";a:2:{i:0;i:1086;i:1;i:1087;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}s:4:"text";s:138:"Packer vmware-iso build on ESXi sans DHCP by @lantrix - https://techdebug.com/blog/2015/09/16/packer-vmware-iso-builder-esxi-without-dhcp/";}'
amazon-product-content-location:
  - 1
amazon-product-excerpt-hook-override:
  - 3
amazon-product-content-hook-override:
  - 2
amazon-product-newwindow:
  - 3
categories:
  - microsoft
  - Windows
  - windows server
tags:
  - 2012 R2
  - autounattend.xml
  - builder
  - dhcp
  - DSC
  - IaC
  - internet access
  - packer
  - provisioing
  - static IP
  - vmware
  - vmware-iso
  - vsphere
  - windows server

---
When you are building Windows Server 2012 R2 base images (vSphere Templates) using packer on vSphere (using [vmware-iso packer builder][1]); the process usually relies on the windows server to get an IP address automatically via DHCP. This allows the packer [builder][2] to then [communicate][3] to the server over WinRM and complete the [provisioning][4].

**What happens when there is no DHCP available in your vSphere VM Network?**

The easy solution is to have the bootstrap of the windows server set a static IP for the server.  
This would allow the packer builder to then communicate to the server over [WinRM][5] and complete the provisioning.  
I already provide an _Autounattend.xml_ to the windows server via the packer [floppy_files][6] stanza for the vmware-iso builder.

These user variables are populated with the environment specific floppy files:

I pass the config json file into the packer build command as shown below. This allows us to pass in different config per environment to the same build template for packer.

`packer.exe build -var-file=Config-VMWare.json .\PackerBaseWin2012R2-VMWare.json`

The _Autounattend.xml_ executes the file _a:\vmware-userdata.ps1_ as the last step of the [FirstLogonCommands][7] setting of the Autounattend process.

The script for this particular environment then uses powershell cmdlets to configure the required static IP address allocated to the Packer Build VM:

**Note:** If you don&#8217;t wait long enough for the boot process to complete; the vmware-iso builder may detect the self assigned IP (169.x.x.x) prior to the userdata script setting the Static IP.  
To solve this you can set the [vmware-iso builder boot_wait][8] to wait a bit longer, e.g. 10 mins.

This solves how to use packer on vSphere for Windows Server 2012 R2 bootstrapping where you don&#8217;t have a DHCP server on the subnet.

 [1]: https://seek.jiveon.com/external-link.jspa?url=https://www.packer.io/docs/builders/vmware-iso.html
 [2]: https://seek.jiveon.com/external-link.jspa?url=https://www.packer.io/docs/templates/introduction.html#builders
 [3]: https://seek.jiveon.com/external-link.jspa?url=https://www.packer.io/docs/templates/communicator.html
 [4]: https://seek.jiveon.com/external-link.jspa?url=https://www.packer.io/docs/templates/introduction.html#provisioners
 [5]: https://www.packer.io/docs/templates/communicator.html#ssh_bastion_private_key_file
 [6]: https://www.packer.io/docs/builders/vmware-iso.html#floppy_files
 [7]: https://seek.jiveon.com/external-link.jspa?url=https://technet.microsoft.com/en-us/library/ff715886.aspx
 [8]: https://seek.jiveon.com/external-link.jspa?url=https://www.packer.io/docs/builders/vmware-iso.html#boot_wait