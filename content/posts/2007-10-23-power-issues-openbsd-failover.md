---
title: Power issues – OpenBSD failover?
author: Tech Debug
type: post
date: 2007-10-22T14:43:04+00:00
url: /blog/2007/10/23/power-issues-openbsd-failover/
tags:
  - failover
  - openbsd
  - power
  - redundancy
categories:
  - openbsd

---
Having had aircon installed today, my headless web server did not recover from the scheduled power outage. It was stuck in a stupid &#8220;Press F1 to Boot&#8221; screen, and as such Tech Debug was down for the majority of the day. Now I have it all back online it is time to consider two things:

  * A UPS
  * A secondary Web/DB server running OpenBSD

Does anyone know they best way to have a failover apache+mysql+postgres OpenBSD server?