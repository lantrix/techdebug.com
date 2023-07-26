---
title: Site slow due to DNS server failure
author: Tech Debug
type: post
date: 2008-06-01T13:12:31+00:00
url: /blog/2008/06/01/site-slow-due-to-dns-server-failure/
tags:
  - dns
  - webhosting
categories:
  - tech

---
The site has been slow recently. I can put this down to the failure of my DNS server. I used an internal caching DNS server for the intranet (where this site is hosted) and it techdebug.com resolves itself internally to a private IP. Whilst the server was off-line I was using an external DNS server, so for the web-server itself apache was resolving the domain name to the external public facing firewall. This meant time-outs and slow pages.

It is all fixed now, and probably time to rebuilt the DNS server up to the latest OpenBSD (Version 4.3).