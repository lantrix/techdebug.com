---
title: awk oneliner to find large files
author: Tech Debug
type: post
date: 2009-03-20T05:48:59+00:00
url: /blog/2009/03/20/awk-oneliner-to-find-large-files/
wp-syntax-cache-content:
  - |
    a:2:{i:1;s:2949:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">find</span> <span style="color: #000000; font-weight: bold;">/</span> <span style="color: #660033;">-type</span> f <span style="color: #660033;">-mtime</span> <span style="color: #660033;">-3</span> <span style="color: #660033;">-exec</span> <span style="color: #c20cb9; font-weight: bold;">ls</span> <span style="color: #660033;">-l</span> <span style="color: #7a0874; font-weight: bold;">&#123;</span><span style="color: #7a0874; font-weight: bold;">&#125;</span> \; <span style="color: #000000;">2</span><span style="color: #000000; font-weight: bold;">&gt;/</span>dev<span style="color: #000000; font-weight: bold;">/</span>null \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">awk</span> <span style="color: #ff0000;">'{print $5 &quot; &quot; $9}'</span> \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">awk</span> <span style="color: #ff0000;">'{printf &quot;%12d\t%s\n&quot;, $1, substr($0,index($0,$2),80)}'</span> \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">sort</span> <span style="color: #660033;">-r</span> <span style="color: #000000; font-weight: bold;">&gt;/</span>tmp<span style="color: #000000; font-weight: bold;">/</span>largefiles.txt <span style="color: #000000; font-weight: bold;">&amp;&amp;</span> \
    <span style="color: #7a0874; font-weight: bold;">&#40;</span> uuencode <span style="color: #000000; font-weight: bold;">/</span>tmp<span style="color: #000000; font-weight: bold;">/</span>largefiles.txt largefiles.txt <span style="color: #7a0874; font-weight: bold;">&#41;</span> \
    <span style="color: #000000; font-weight: bold;">|</span> mailx <span style="color: #660033;">-s</span> <span style="color: #ff0000;">'Large Files Report'</span> <span style="color: #660033;">-r</span> mail2<span style="color: #000000; font-weight: bold;">@</span>youremail.com <span style="color: #000000; font-weight: bold;">`</span><span style="color: #c20cb9; font-weight: bold;">cat</span> <span style="color: #000000; font-weight: bold;">/</span>tmp<span style="color: #000000; font-weight: bold;">/</span>mailrecipients<span style="color: #000000; font-weight: bold;">`</span> <span style="color: #000000; font-weight: bold;">&amp;</span></pre></td></tr></table><p class="theCode" style="display:none;">find / -type f -mtime -3 -exec ls -l {} \; 2&gt;/dev/null \
    | awk '{print $5 &quot; &quot; $9}' \
    | awk '{printf &quot;%12d\t%s\n&quot;, $1, substr($0,index($0,$2),80)}' \
    | sort -r &gt;/tmp/largefiles.txt &amp;&amp; \
    ( uuencode /tmp/largefiles.txt largefiles.txt ) \
    | mailx -s 'Large Files Report' -r mail2@youremail.com `cat /tmp/mailrecipients` &amp;</p></div>
    ";i:2;s:1640:"
    <div class="wp_syntax" style="position:relative;"><table><tr><td class="code"><pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">find</span> <span style="color: #000000; font-weight: bold;">/</span> <span style="color: #660033;">-type</span> f <span style="color: #660033;">-mtime</span> <span style="color: #660033;">-3</span> <span style="color: #660033;">-exec</span> <span style="color: #c20cb9; font-weight: bold;">ls</span> <span style="color: #660033;">-l</span> <span style="color: #7a0874; font-weight: bold;">&#123;</span><span style="color: #7a0874; font-weight: bold;">&#125;</span> \; <span style="color: #000000;">2</span><span style="color: #000000; font-weight: bold;">&gt;/</span>dev<span style="color: #000000; font-weight: bold;">/</span>null \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">awk</span> <span style="color: #ff0000;">'{print $5 &quot; &quot; $9}'</span> \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">awk</span> <span style="color: #ff0000;">'{printf &quot;%12d\t%s\n&quot;, $1, substr($0,index($0,$2),80)}'</span> \
    <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">sort</span> <span style="color: #660033;">-r</span></pre></td></tr></table><p class="theCode" style="display:none;">find / -type f -mtime -3 -exec ls -l {} \; 2&gt;/dev/null \
    | awk '{print $5 &quot; &quot; $9}' \
    | awk '{printf &quot;%12d\t%s\n&quot;, $1, substr($0,index($0,$2),80)}' \
    | sort -r</p></div>
    ";}
categories:
  - unix
tags:
  - bash
  - script
  - solaris
  - unix

---
A mega geeky awk one-liner today. Tested on Solaris under bash, so [YMMV][1].

Have you ever found that a filesystem is filling up fast, and dont know what is causing it? This one liner (which can be placed in a cron job if you like) is best run as a super user.

It will:

  1. Search for all files in the current dir and subdirs that are modified in the last 3 days;
  2. list them, filtering just the filesize and name/path;
  3. sort/order by the largest file; and
  4. Email you a copy of the report.

<pre lang="bash">find / -type f -mtime -3 -exec ls -l {} \; 2>/dev/null \<br />
| awk '{print $5 " " $9}' \<br />
| awk '{printf "%12d\t%s\n", $1, substr($0,index($0,$2),80)}' \<br />
| sort -r >/tmp/largefiles.txt && \<br />
( uuencode /tmp/largefiles.txt largefiles.txt ) \<br />
| mailx -s 'Large Files Report' -r mail2@youremail.com `cat /tmp/mailrecipients` &<br />
</code></p>


<p>
  Nice. If you just want to see the response on stdout then try this:
</p>


<pre lang="bash">
find / -type f -mtime -3 -exec ls -l {} \; 2>/dev/null \<br />
| awk '{print $5 " " $9}' \<br />
| awk '{printf "%12d\t%s\n", $1, substr($0,index($0,$2),80)}' \<br />
| sort -r<br />
</code></p>


<p>
  Have fun.
</p>

 [1]: http://en.wikiepedia.org/wiki/YMMV