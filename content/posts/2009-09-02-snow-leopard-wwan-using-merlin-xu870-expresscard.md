---
title: 'Snow Leopard: WWAN using Merlin XU870 ExpressCard'
author: Tech Debug
type: post
date: 2009-09-02T12:20:32+00:00
url: /blog/2009/09/02/snow-leopard-wwan-using-merlin-xu870-expresscard/
categories:
  - apple
  - hardware
  - internet
tags:
  - 10.6
  - snow leopard
  - three broadband
  - WWAN
  - xu870

---
This is the same issue I&#8217;ve posted on a couple of forums. It&#8217;s seemed detailed enough to be a blog post, so here it is. Under 10.5.8 (Leopard) I was successfully using my Merlin XU870 ExpressCard (supplied by ISP) with Three Broadband (3) in Australia. I did not use the 3 drivers, but used the Leopard WWAN built-in to connect. There was never an issue as Leopard detected the card as a &#8220;Novatel Wireless HSDPA Modem&#8221;, and I configured the Network Advanced settings for 3 postpaid services as:

  * Vendor: Novatel Wireless Inc.
  * Model: GSM
  * APN: 3netaccess
  * CID: 1

I installed Snow Leopard as an Upgrade (not a fresh install) after having a CCC backup and a Time machine backup in place.  
  
When I plugged in my 3 expresscard, 10.6 detects the card, initialises and populates the WWAN icon with &#8220;Telstra 3G: Not Configured&#8221;.  
<img decoding="async" src="http://s375.photobucket.com/albums/oo195/lantrix/apple/wwan01.png" alt="Screenshot 1" />  
It detects the card as a &#8220;Novatel Wireless HSDPA Modem&#8221;, and automatically configures the Network Advanced settings of the card, as shown:  
<img decoding="async" src="http://s375.photobucket.com/albums/oo195/lantrix/apple/wwan02.png" alt="Screenshot 2" />  
The question is: Why is the APN _telstra.datapack_ setup as default?  
  
I am able to **change the APN to _3netaccess_**, which results in a successful connection to 3:  
`Wed Sep  2 15:38:25 2009 : Initializing phone: ATE0V1&F&D2&C1S0=0<br />
Wed Sep  2 15:38:25 2009 : Initializing PDP context: AT+CGDCONT=1,"IP","3netaccess"<br />
Wed Sep  2 15:38:25 2009 : Initializing with secondary command: AT$NWPDN=0<br />
Wed Sep  2 15:38:25 2009 : Dialing: ATD*99***1<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a><br />
Wed Sep  2 15:38:25 2009 : Waiting for connection<br />
Wed Sep  2 15:38:25 2009 : Connection established<br />
Wed Sep  2 15:38:28 2009 : Serial connection established.<br />
Wed Sep  2 15:38:28 2009 : Using interface ppp0<br />
Wed Sep  2 15:38:28 2009 : Connect: ppp0 <--> /dev/cu.wwan<br />
Wed Sep  2 15:38:32 2009 : Could not determine remote IP address: defaulting to 10.64.***.***<br />
Wed Sep  2 15:38:32 2009 : local  IP address 115.130.***.***<br />
Wed Sep  2 15:38:32 2009 : remote IP address 10.64.***.***<br />
Wed Sep  2 15:38:32 2009 : primary   DNS address 202.124.68.182<br />
Wed Sep  2 15:38:32 2009 : secondary DNS address 202.124.65.22`

The **annoying thing is the WWAN menu still shows Telstra** when connected.  
<img decoding="async" src="http://s375.photobucket.com/albums/oo195/lantrix/apple/wwan03.png" alt="Screenshot 3" />  
  
Looking at the WWAN system file:  
`cd /System/Library/Extensions/IOSerialFamily.kext/\<br />
Contents/PlugIns/AppleWWANSupport.kext/Contents/\<br />
Resources/<br />
less countryCodes.plist`  
it has only Telstra, Optus and Vodafone carriers listed. I think this could be the cause of the default APN being populated in the Advanced settings. I can&#8217;t find where the &#8220;Telstra 3G&#8221; in the WWAN menu item is coming from though.  
  
I&#8217;d appreciate if anyone can give their thoughts on how to fix this.