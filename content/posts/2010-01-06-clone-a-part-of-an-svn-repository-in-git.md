---
title: Clone a part of an SVN repository in git
author: Tech Debug
type: post
date: 2010-01-05T15:03:18+00:00
url: /blog/2010/01/06/clone-a-part-of-an-svn-repository-in-git/
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";s:0:"";s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";s:2:"60";s:7:"version";s:3:"3.2";s:14:"tweet_template";s:0:"";s:6:"status";s:1:"3";s:6:"result";a:0:{}s:13:"tweet_counter";s:1:"1";s:13:"tweet_log_ids";a:0:{}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - git
tags:
  - clone
  - git
  - higher
  - level
  - partial
  - repository
  - svn
  - URL

---
I was trying to clone my wordpress plugin from the wordpress svn [repo][1] using [git-svn][2]. I had no luck for about the past 8 weeks, with this problem:

`<br />
Initialized empty Git repository in /Users/lantrix/tweet/.git/<br />
Using higher level of URL: http://plugins.svn.wordpress.org/tweet => http://plugins.svn.wordpress.org<br />
` 

And it would proceed to hit up the entire wordpress repo.  
After reading a possible solution on [Charlie&#8217;s Old blog][3], I stubmled across a [newer way][4] to do this.

As of v1.6.4 of git, you can now use a _&#8211;no-minimize-url_ when doing a git-svn clone. This makes git clone only the part of the repo you want; and the added bonus is you can get all your tags and branches.

Here is how I did it:  


It still took a while to parse all the SVN history, and now of course this stands out in the [git-svn doco][5] 😛

The authors.txt file just mapped my svn users to git user/email pair, e.g.:  
`<br />
lantrix = Lantrix <lantrix@somewhere.com><br />
plugin-master = none <none@none.com><br />
(no author) = none <none@none.com><br />
` 

You will probably want to have a look at these set of scripts. Have a read of [NothingMuch&#8217;s perl blo][6]g for extra steps and details on extra svn conversion scripts.

 [1]: http://plugins.svn.wordpress.org/tweet/
 [2]: http://git-scm.com
 [3]: http://yapr.wordpress.com/2007/12/31/partial-git-clone-of-svn-subdirectory/
 [4]: http://stackoverflow.com/questions/1453416/git-svn-clone-checkouts-wrong-repo
 [5]: http://www.kernel.org/pub/software/scm/git/docs/git-svn.html
 [6]: ttp://blog.woobling.org/2009/06/git-svn-abandon.html