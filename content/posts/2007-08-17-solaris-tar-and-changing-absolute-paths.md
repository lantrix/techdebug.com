---
title: Solaris tar and changing absolute paths
author: Tech Debug
type: post
date: 2007-08-17T03:24:36+00:00
url: /blog/2007/08/17/solaris-tar-and-changing-absolute-paths/
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:3;s:6:"result";a:0:{}s:13:"tweet_counter";i:1;s:13:"tweet_log_ids";a:0:{}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
wp-syntax-cache-content:
  - |
    a:1:{i:1;s:3556:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="bash" style="font-family:monospace;">you<span style="color: #000000; font-weight: bold;">@</span>yourserver:~ $ <span style="color: #c20cb9; font-weight: bold;">tar</span> tvf data_backup.tar 
    <span style="color: #660033;">-rwxrwx---</span> <span style="color: #000000;">13406</span><span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">1201</span> <span style="color: #000000;">2881056</span> Apr <span style="color: #000000;">26</span> <span style="color: #000000;">19</span>:<span style="color: #000000;">29</span> <span style="color: #000000;">2007</span> <span style="color: #000000; font-weight: bold;">/</span>apps<span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>data<span style="color: #000000; font-weight: bold;">/</span><span style="color: #c20cb9; font-weight: bold;">file</span> 
    <span style="color: #660033;">-rwxrwx---</span> <span style="color: #000000;">13406</span><span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">1201</span> <span style="color: #000000;">485376</span> Apr <span style="color: #000000;">26</span> <span style="color: #000000;">19</span>:<span style="color: #000000;">29</span> <span style="color: #000000;">2007</span> <span style="color: #000000; font-weight: bold;">/</span>apps<span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>data<span style="color: #000000; font-weight: bold;">/</span>file.idx 
    you<span style="color: #000000; font-weight: bold;">@</span>yourserver:~ $ pax <span style="color: #660033;">-r</span> <span style="color: #660033;">-s</span> <span style="color: #ff0000;">'=^/apps/server=/home/you='</span> <span style="color: #000000; font-weight: bold;">&lt;</span> data_backup.tar 
    you<span style="color: #000000; font-weight: bold;">@</span>yourserver:~ $ <span style="color: #c20cb9; font-weight: bold;">ls</span> <span style="color: #660033;">-l</span> <span style="color: #000000; font-weight: bold;">/</span>home<span style="color: #000000; font-weight: bold;">/</span>you<span style="color: #000000; font-weight: bold;">/</span>data<span style="color: #000000; font-weight: bold;">/</span> 
    total <span style="color: #000000;">6624</span> 
    <span style="color: #660033;">-rwxr-x---</span>   <span style="color: #000000;">1</span> d292462  strata   <span style="color: #000000;">2881056</span> Apr <span style="color: #000000;">26</span> <span style="color: #000000;">19</span>:<span style="color: #000000;">29</span> <span style="color: #c20cb9; font-weight: bold;">file</span> 
    <span style="color: #660033;">-rwxr-x---</span>   <span style="color: #000000;">1</span> d292462  strata    <span style="color: #000000;">485376</span> Apr <span style="color: #000000;">26</span> <span style="color: #000000;">19</span>:<span style="color: #000000;">29</span> file.idx</pre></td></tr></table><p class="theCode" style="display:none;">you@yourserver:~ $ tar tvf data_backup.tar 
    -rwxrwx--- 13406/1201 2881056 Apr 26 19:29 2007 /apps/server/data/file 
    -rwxrwx--- 13406/1201 485376 Apr 26 19:29 2007 /apps/server/data/file.idx 
    you@yourserver:~ $ pax -r -s '=^/apps/server=/home/you=' &lt; data_backup.tar 
    you@yourserver:~ $ ls -l /home/you/data/ 
    total 6624 
    -rwxr-x---   1 d292462  strata   2881056 Apr 26 19:29 file 
    -rwxr-x---   1 d292462  strata    485376 Apr 26 19:29 file.idx</p></div>
    ";}
categories:
  - unix
tags:
  - pax
  - solaris
  - tar
  - unix

---
On linux and other [Unix like operating systems][1], you can untar a tar file with an absolute path to a different location. On Solaris using tar you can not. How do you get around this? [Perderabo on the Unix for Advanced and Expert Users forum][2] describes how. Here is an example (names and servers changed to protect the innocent):

<pre lang="bash">you@yourserver:~ $ tar tvf data_backup.tar<br />
-rwxrwx--- 13406/1201 2881056 Apr 26 19:29 2007 /apps/server/data/file<br />
-rwxrwx--- 13406/1201 485376 Apr 26 19:29 2007 /apps/server/data/file.idx<br />
you@yourserver:~ $ pax -r -s '=^/apps/server=/home/you=' < data_backup.tar 
you@yourserver:~ $ ls -l /home/you/data/ 
total 6624 
-rwxr-x---   1 d292462  strata   2881056 Apr 26 19:29 file 
-rwxr-x---   1 d292462  strata    485376 Apr 26 19:29 file.idx 
</code></p>


<p>
  The key is the string given to pax <em>'=^/apps/server=/home/you='. The </em><em>/apps/server</em> is the path you are replacing and the <em>/home/you</em> is the new path you are forcing tar to untar to. Mix and match as required. But the first string (/apps/server) is the part of the absolute path of each tarred file.
</p>


<p>
  Now get to it.
</p>

 [1]: http://www.openbsd.org/ "OpenBSD"
 [2]: http://www.unix.com/unix-for-advanced-and-expert-users/21390-untar-to-different-location.html#post82897 "Untar to different location - The UNIX Forums"