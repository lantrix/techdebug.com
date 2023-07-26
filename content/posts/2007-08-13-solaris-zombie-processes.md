---
title: Solaris Zombie processes
author: Tech Debug
type: post
date: 2007-08-13T04:30:36+00:00
url: /blog/2007/08/13/solaris-zombie-processes/
categories:
  - unix

---
In Solaris (and UNIX), a process is a zombie, as shown by the message _defunct_ in the ps report. A zombie process is one that has had all its resources freed, but has not received an acknowledgement from a parent process, receipt of which would ordinarily remove its entry from the process table.

The next time a system is booted, zombie processes are cleared. Zombies should not affect system performance, and you should not need to remove them. Only if you start getting a large number, may zombies affect performance as they hold memory resources.

You cannot kill zombies, as they are already dead 🙂 however from Solaris 9 onwards, there is a tool, _[preap][1]_ that may successfully remove zombie processes. Otherwise the only way to kick them off is reboot.

 [1]: http://docs.sun.com/app/docs/doc/816-0210/6m6nb7mi1?l=en&a=view&q=preap "docs.sun.com: man pages section 1: User Commands"