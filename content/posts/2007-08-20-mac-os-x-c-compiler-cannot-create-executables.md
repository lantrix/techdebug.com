---
title: Mac OS X – C compiler cannot create executables
author: Tech Debug
type: post
date: 2007-08-19T22:24:01+00:00
url: /blog/2007/08/20/mac-os-x-c-compiler-cannot-create-executables/
categories:
  - unix

---
[A friend][1] was trying to compile cvsgraph on his Mac (10.4.10 intel) the other day and was receiving the error  
`<br />
	configure: error: C compiler cannot create executables<br />
`  
By chance he also tried installing a Fink package by source that day as well, and received the same error. We checked out the GCC version  
`<br />
gcc -v<br />
`  
and it showed GCC 3.3. Some google time later, and it turns out this is an older GCC for the current XCode SDK he has installed. Somehow the system needed to be told what GCC to use, so this is the command that saved the day  
`<br />
sudo gcc_select 4.0<br />
`  
Simple fix really.

 [1]: http://www.90kts.com/blog