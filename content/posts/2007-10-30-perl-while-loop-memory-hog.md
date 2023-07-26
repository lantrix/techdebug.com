---
title: Perl while loop memory hog
author: Tech Debug
type: post
date: 2007-10-29T23:16:57+00:00
url: /blog/2007/10/30/perl-while-loop-memory-hog/
tags:
  - cpu
  - hog
  - IO::file
  - openbsd
  - perl
  - script
  - sql
categories:
  - perl
  - unix

---
I was trying to use [someone elses script][1] for logging [dansguardian][2] events to an RDBMS.The script was chewing up 99% of my CPU! I got chatting [to a friend and a perl coder about this][3], and got some ideas. He showed me about the perl debugger using the -d switch. Awesome. I finally got my perl script working. Installing the DBI package on OpenBSD was a snap with pkg_add (`pkg_add -v p5-DBD-Pg-1.47.tgz`). My logical debugging was as follows.

first I read that DBI was a memory hog so I wrote it out and put in a native postgres call, but the pgsql for perl was borked.  
(comment from coding friend &#8220;DBI is fine man, works for the massess&#8221;). Next I changed the while loop over the the file to a Tail::File method, but the module was badly documenting and had issues.

I actually ended up using IO::File to tail the log and looped over the lines (in a mad loop), but it was still broken.  
So I went back to DBI, which as my friend pointed out was never a problem. It worked!

It turned out the loop was the CPU hog and all I had to do was put in a `sleep 1;` if there was no new line in the tail.  
In the process I rewrote the whole script and it barely resembles the original except for the idea. _Now it has 0.5% CPU load at best_. A win for coding. I&#8217;ll post the script soon and also send it to dansguardian.

Comment from perl coding friend: of course &#8211; i guessed that after u left. 🙂

 [1]: http://dansguardian.org/downloads/kusar/sqllogfifo.pl
 [2]: http://dansguardian.org/?page=extras
 [3]: http://90kts.com/blog/