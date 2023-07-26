---
title: Fixed iChat AV thru OpenBSD PF Firewall
author: Tech Debug
type: post
date: 2010-01-14T01:41:08+00:00
url: /blog/2010/01/14/fixed-ichat-av-thru-openbsd-pf-firewall/
categories:
  - Musings
tags:
  - 4.5
  - audio
  - firewall
  - ichat
  - NAT
  - opebsd
  - pf
  - scrub
  - TCP
  - video

---
This has been bugging me for ages, but the fix is so simple.  
I use OpenBSD for my router, and have PF (Packet Filter) running the firewall and NAT rules.

I have previously setup the port forwarding, etc. [according to Apple][1], but never could get a successful connection using video or audio (or screen sharing).

After reading [a post][2] on the OpenBSD misc mailing list I went back and read the [OpenBSD 4.5 pf.conf man page][3].

There is a section of the man page that states (my emphasis):

> _fragment reassemble_  
> Using scrub rules, fragments can be reassembled by normalization.  
> In this case, fragments are buffered until they form a complete  
> packet, and only the completed packet is passed on to the filter.  
> The advantage is that filter rules have to deal only with complete  
> packets, and can ignore fragments. The drawback of caching frag-  
> ments is the additional memory cost. **But the full reassembly  
> method is the only method that currently works with NAT.** This is  
> the default behavior of a scrub rule if no fragmentation modifier  
> is supplied. 

My scrub settings were such that I was filtering not complete packets, but fragments. The moment I changed the scrub settings to this:  
`<br />
scrub in on $ext_if all fragment reassemble<br />
` 

All worked perfect. I can initiate iChat calls and receive them too. Desktop sharing now works as well. All using Google talk (jabber) in iChat.

Note that in OpenBSD 4.6 or current there have been PF changes, so the wording of the scrub rule may be different. **Always read the pf.conf man page for the release you are on.**

 [1]: http://support.apple.com/kb/HT1507
 [2]: http://marc.info/?l=openbsd-misc&m=126323736521729&w=2
 [3]: http://www.openbsd.org/cgi-bin/man.cgi?query=pf.conf&apropos=0&sektion=0&manpath=OpenBSD+4.5&arch=i386&format=html