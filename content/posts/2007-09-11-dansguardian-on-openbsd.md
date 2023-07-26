---
title: Dansguardian on OpenBSD
author: Tech Debug
type: post
date: 2007-09-10T14:16:05+00:00
url: /blog/2007/09/11/dansguardian-on-openbsd/
tags:
  - content filter
  - dansguardian
  - openbsd
  - proxy
  - squid
  - transparent
categories:
  - apps
  - openbsd
  - tech
  - unix

---
<p style="float: right; margin-bottom: 10px; margin-left: 10px">
  <a href='http://openbsd.org' title='OpenBSD'><img src='https://techdebug.com/wp-content/uploads/2007/09/puflogv200x130.gif' alt='OpenBSD_logo' /></a>
</p>

So many people have written [long and excellent examples][1] of an internet application layer filtering solution.

However, what if you need a quick and simple internet filtering solution? Want to block out all the garbage for the younger generation?  
Look no further than [Dansguardian][2].  
I&#8217;ll assume you love [OpenBSD][3] as well, and have the following in place:

  * OpenBSD running as your router, [multi-homed][4]
  * the same machine running [pf][5]
  * the same machine with [squid installed and working as a transparent proxy][6]
  * Packet filtering is online, your internet access works from the router and from an internal host with your [squid working transparently][7]
  * [wget][8] installed

Download the latest beta from dansguardian.org and extract it, reading the install doco for good reference:  
`<br />
cd /tmp<br />
wget http://dansguardian.org/downloads/2/Beta/dansguardian-2.9.9.1.tar.gz<br />
tar zxvf dansguardian-2.9.9.1.tar.gz<br />
cd dansguardian-2.9.9.1<br />
less INSTALL<br />
`  
Once you have had a read of the install, configure and compile quickly for OpenBSD  
`<br />
./configure \<br />
--mandir=/usr/local/man \<br />
--with-logdir=/var/log/dansguardian \<br />
--bindir=/usr/local/bin \<br />
--sysconfdir=/usr/local/etc<br />
mkdir /var/log/dansguardian<br />
make<br />
make install<br />
make clean<br />
`  
This will provide you an installed copy of Dans with a default config set.  
Now setup Dans to stop/start during init and shutdown  
`<br />
chmod +x /usr/local/share/dansguardian/scripts/bsd-init<br />
cat >> /etc/rc.local << EOF
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> DansGuardian<br />
if [ -x /usr/local/sbin/dansguardian ]; then<br />
 /usr/local/share/dansguardian/scripts/bsd-init start<br />
fi<br />
EOF<br />
cat >> /etc/rc.shutdown << EOF
vi /etc/rc.shutdown
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> DansGuardian<br />
if [ -x /usr/local/sbin/dansguardian ]; then<br />
 /usr/local/share/dansguardian/scripts/bsd-init stop<br />
fi<br />
EOF<br />
`  
Almost done. Setup PF to redirect all Web access through Dans, which will use squid.  
In this example, hosts 10.0.1.1 and 10.0.1.2 will not use the filter, and all other hosts will. Change IPs to suit your needs.  
`<br />
cat >> /etc/pf.conf << EOF
no rdr on $int_if from { 10.0.1.1, 10.0.1.2 } to any
rdr on $int_if inet proto { tcp, udp } from any to any port www -> 127.0.0.1 port 8080<br />
EOF<br />
pfctl -f /etc/pf.conf<br />
`  
Now lastly startup Dans for this session. You may learn [how the flow works][9], and what to configure on the products site.  
`<br />
/usr/local/share/dansguardian/scripts/bsd-init start<br />
`  
I hope that gives you an idea how easy this is to setup, now go and have a hack and see what you can do with squid and authentication! Chop Chop!

 [1]: http://itdiscuss.org/twiki/bin/view/Main/OpenBSDDansguardianSquid
 [2]: http://dansguardian.org
 [3]: http://www.openbsd.org
 [4]: http://en.wikipedia.org/wiki/Multi-homed
 [5]: http://www.benzedrine.cx/pf.html
 [6]: http://www.openbsd.org/4.1_packages/i386/squid-2.6.STABLE9-transparent-snmp.tgz-long.html
 [7]: http://itdiscuss.org/twiki/bin/view/Main/OpenBSDDansguardianSquid#Squid_As_A_Transparent_Squid_Pro
 [8]: http://www.openbsd.org/4.1_packages/i386/wget-1.10.2p0.tgz-long.html
 [9]: http://dansguardian.org/?page=dgflow