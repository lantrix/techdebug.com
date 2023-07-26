---
title: Compiling readline on an OSX 10.5 intel x86_64
author: Tech Debug
type: post
date: 2009-01-02T15:33:13+00:00
url: /blog/2009/01/03/compiling-readline-on-an-osx-105-intel-x86_64/
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";s:0:"";s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";s:2:"60";s:7:"version";s:3:"3.2";s:14:"tweet_template";s:0:"";s:6:"status";s:1:"3";s:6:"result";a:0:{}s:13:"tweet_counter";s:1:"1";s:13:"tweet_log_ids";a:0:{}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - apple
  - mac
  - unix
tags:
  - 10.5
  - apple
  - architecure
  - compile
  - i386
  - intel
  - leopard
  - mac
  - readline
  - unix
  - x86_64

---
I&#8217;m stuck with a whole bunch of problems getting code to compile and co-operate nicely on my new MacBookPro. I&#8217;m compiling my own PHP, but it defaults to compiling for the i386 (32bit) architecure, which then fails when Apache2 running in 64bit mode tries to use the 32bit DSO for PHP5. Compiling PHP5 as 64bit then fails linking against the i386 pgsql lib, and so on. I really need everything using the x86_64 architecture. How does this all relate to readline under Leopard?  
<!--more-->

The problem is the Intel Core2 Duo is a 64bit CPU. Apple supplied apps like Apache2 are compiled as Universal binary AND for 32/64bits. This means there are 4 architectures in the binaries.

`<br />
lantrix@lexx:~ $ file /usr/sbin/httpd<br />
/usr/sbin/httpd: Mach-O fat file with 4 architectures<br />
` 

When I compile PHP as x86\_64 of course it complains that the pgsql libs are also not x86\_64, and when I compile postgresql as x86\_64, it complains the fink readline library I use is not x86\_64. Talk about architectural dependancies! I will need to do another post in depth on the fun had with that whole set of dependancies.

**This is how and why I arrived at compiling readline on my Mac 64bit intel under Leopard**.

On to the readline problems. I start the compile of readline as x86_64 architecture, and this occurs:  
``gcc -dynamic -arch x86_64 -bind_at_load -arch_only `/usr/bin/arch` -install_name /usr/local/lib/libreadline.5.2.dylib -current_version 5.2 -compatibility_version 5 -v -o libreadline.5.2.dylib readline.so vi_mode.so funmap.so keymaps.so parens.so search.so rltty.so complete.so bind.so isearch.so display.so signals.so util.so kill.so undo.so macro.so input.so callback.so terminal.so text.so nls.so misc.so xmalloc.so history.so histexpand.so histfile.so histsearch.so shell.so mbutil.so tilde.so compat.so -lncurses<br />
Using built-in specs.<br />
Target: i686-apple-darwin9<br />
Configured with: /var/tmp/gcc/gcc-5465~16/src/configure --disable-checking -enable-werror --prefix=/usr --mandir=/share/man --enable-languages=c,objc,c++,obj-c++ --program-transform-name=/^[cg][^.-]*$/s/$/-4.0/ --with-gxx-include-dir=/include/c++/4.0.0 --with-slibdir=/usr/lib --build=i686-apple-darwin9 --with-arch=apple --with-tune=generic --host=i686-apple-darwin9 --target=i686-apple-darwin9<br />
Thread model: posix<br />
gcc version 4.0.1 (Apple Inc. build 5465)<br />
i686-apple-darwin9-gcc-4.0.1: -compatibility_version only allowed with -dynamiclib<br />
make[1]: *** [libreadline.5.2.dylib] Error 1<br />
make: [shared] Error 2 (ignored)``

Google is your friend, and MacOSXHints forum user [dmacks has an answer][1] why this occurs.

> The readline compile scripting is ugly (doesn&#8217;t use standard build tools, then fakes it&#8230;poorly at times). You need -dynamiclib not -dynamic to compile a shared library on OS X, but this indicates a deeper problem: need to patch support/shobj-conf to know darwin9\* as a Darwin/MacOS system if you&#8217;re on Leopard (I think readline5.2 only recognizes darwin8\*, i.e., Tiger).

Still this is not a fix&#8230;. But some further searching and I find a [Christopher Rasch on a Watir mailing list][2] who shows how to get around this. Effectivly you need to change the makefile for [readlines][3] shlibs to use the _-dynamiclib_ switch when compiling.

This gave me a local x86_64 architecure readline library under Leopard. I was able to successfully compile PostgreSQL as _-arch x86_64_ against the readline library as well.

`<br />
lantrix@lexx:/usr/local/src/readline-5.2 $ ls -l /usr/local/lib/libreadline.*<br />
-r-xr-xr-x  1 root  lantrix  272480  3 Jan 02:06 /usr/local/lib/libreadline.5.2.dylib<br />
lrwxr-xr-x  1 root  lantrix      21  3 Jan 02:06 /usr/local/lib/libreadline.5.dylib -> libreadline.5.2.dylib<br />
-rw-r--r--  1 root  lantrix  934864  3 Jan 02:06 /usr/local/lib/libreadline.a<br />
lrwxr-xr-x  1 root  lantrix      21  3 Jan 02:06 /usr/local/lib/libreadline.dylib -> libreadline.5.2.dylib<br />
` 

Do what you will with them 🙂

 [1]: http://forums.macosxhints.com/showpost.php?p=421408&postcount=3
 [2]: http://rubyforge.org/pipermail/wtr-general/2007-February/009632.html
 [3]: http://tiswww.case.edu/php/chet/readline/rltop.html#CurrentStatus