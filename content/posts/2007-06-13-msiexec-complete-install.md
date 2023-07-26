---
title: MSIEXEC Complete Install
author: Tech Debug
type: post
date: 2007-06-13T07:36:43+00:00
url: /blog/2007/06/13/msiexec-complete-install/
categories:
  - microsoft
  - tech

---
If you want to install an MSI with no user intervention, and scripted, you can use msiexec. But what if you want to do a complete installation on the product, instead of a typical installation (which would be default)? Put this in your script:  
`<br />
msiexec /i yourpackage.msi /passive ADDLOCAL=ALL`  
ADDLOCAL=ALL is the key to a complete install. Enjoy your automated windows installation.