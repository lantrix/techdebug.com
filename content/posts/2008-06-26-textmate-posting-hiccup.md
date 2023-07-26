---
title: Textmate Posting Hiccup
author: Tech Debug
type: post
date: 2008-06-26T10:06:43+00:00
url: /blog/2008/06/26/textmate-posting-hiccup/
tags:
  - error
  - textmate
  - wordpress
categories:
  - apps
  - mac

---
Forgive my triple Post Hiccup. When Textmate posted my blog posts, I got errors.  
Thinking the post had not completed, I retried until I figured out the problem.  
If you use WordPress V2.3 and post with Textmate, then don&#8217;t try to add a new category when posting an article. You get this problem:  
`<br />
	Fatal error: Cannot use object of type WP_Error as array in wp-includes/taxonomy.php on line 1010<br />
`  
Looks like [I am not the only one][1].

 [1]: http://wordpress.org/support/topic/138364 "WordPress &#8250; Support &raquo; Help WP_Error when saving pages"