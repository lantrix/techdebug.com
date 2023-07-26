---
title: Move WordPress Comments
author: Tech Debug
type: post
date: 2007-11-15T10:41:17+00:00
url: /blog/2007/11/15/move-wordpress-comments/
categories:
  - apps

---
Those of you who read this, and also use wordpress for your own blogs, will appreciate this one.

WordPress has no native way of moving comments that are incorrectly posted under another post. You can have a hack at the database yourself, or you can use a plugin that recently (in the last few months) went to Version 1.

I came across it while trolling google for a decent solution to a mis posted comment.  
It is as simple as this to install (I have my own server, so I have shell access, YMMV):  
`<br />
livewire:/tmp<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> cd /tmp/<br />
livewire:/tmp<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> unzip move_comments.zip<br />
livewire:/tmp<a href="http://search.twitter.com/search?q=%23" class="tweet-hashtag">#</a> mv move_comments /var/www/htdocs/wp-content/plugins/<br />
`  
Then activate the plugin in your wordpress plugins admin page. You then gain access to quickly move any comment to any post shown:  
![Move Comment][1] 

**You can download it from the [authors own blog][2]**.

 [1]: https://techdebug.com/wp-content/uploads/2007/11/movecomments.png
 [2]: http://www.dountsis.com/projects/move-comments/