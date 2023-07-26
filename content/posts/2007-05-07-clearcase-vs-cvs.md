---
title: Clearcase vs CVS
author: Tech Debug
type: post
date: 2007-05-07T04:07:57+00:00
url: /blog/2007/05/07/clearcase-vs-cvs/
categories:
  - tech
  - unix

---
I recently starting using [Clearcase][1] for versioning, at work. I come from a CVS background, so initially found it to be cumbersome. For example, here is how i added a file to the repository:

CVS method:

`<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> Change to your already checked out working folder<br />
cd /your/working/dir<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> list folder contents, will see checked out working files<br />
ls -l<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> List status of all the files, (optionally, update if needed)<br />
cvs -qn up<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> copy in new file to commit<br />
cp ~/yourfile.sh .<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> add file to repository<br />
cvs add yourfile.sh<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> commit changes, and make add permanent<br />
cvs commit -m "commit message"<br />
` 

Clearcase method:

`<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> Change to your pre-defined clearcase VOB top level folder (will be empty)<br />
cd /your/working/dir<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> set your view<br />
cleartool setview [viewname]<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> list folder contents, will see working files through "this view"<br />
ls -l<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> List status of all the files<br />
cleartool ls -l<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> Make current folder checked out for modifications, -nc means no comment<br />
cleartool co -nc .<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> copy in new file to commit<br />
cp ~/yourfile.sh<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> make new file a new element, and check it in (just like cvs add)<br />
ct mkelem -ci yourfile.sh -c "commit message"<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> check in current folder, as modifications are done, -nc means no comment<br />
cleartool ci -nc .<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> end your view. your folder is now empty<br />
cleartool endview [viewname]<br />
<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> release your license (if needed)<br />
clearlicense -release<br />
` 

See? CVS is simpler. But you have to work with what you have. I can see the benefit of Clearcase in a complex development environment. Expect to hear more from me on this tool from IBM.

 [1]: http://www.ibm.com/developerworks/rational/products/clearcase