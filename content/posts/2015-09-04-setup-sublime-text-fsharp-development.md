---
title: 'Setup Sublime Text for F# Development'
author: Tech Debug
type: post
date: 2015-09-04T03:27:26+00:00
url: /blog/2015/09/04/setup-sublime-text-fsharp-development/
wordtwit_posted_tweets:
  - 'a:1:{i:0;i:1076;}'
wordtwit_post_info:
  - 'O:8:"stdClass":13:{s:6:"manual";b:0;s:11:"tweet_times";s:1:"1";s:5:"delay";s:1:"0";s:7:"enabled";s:1:"1";s:10:"separation";i:60;s:7:"version";s:3:"3.7";s:14:"tweet_template";b:0;s:6:"status";i:2;s:6:"result";a:0:{}s:13:"tweet_counter";i:2;s:13:"tweet_log_ids";a:1:{i:0;i:1076;}s:9:"hash_tags";a:0:{}s:8:"accounts";a:1:{i:0;s:9:"techdebug";}}'
categories:
  - coding
  - fsharp
  - Mac
tags:
  - F Sharp
  - 'F#'
  - mac
  - Mono
  - package control
  - REPL
  - sublime
  - sublime text 3

---
After being asked to use Visual Studio 2015 for F[#][1]{.tweet-hashtag} Development, I decided it&#8217;s way more lightweight to to develop it on my Mac using Sublime Text 3.

Software you need installed:

  * Install [Mono][2] on your Mac
  * Of course [Sublime Text 3][3]
  * And the best package manager for Sublime, [Package Control][4].

Install ([using][5] package control) these packages with package control in Sublime Text:

  * [F#][6] &#8211; Gives you syntax Highlighting
  * [F-Sharp][7] &#8211; Autocomplete, tooltips, definitions, etc.
  * [SublimeREPL][8] &#8211; A multi language REPL including F#

If you are used to Visual Studio for any F[#][1]{.tweet-hashtag} development; you can create some Sublime text keyboard shortcuts using your [key bindings][9] settings:

  * Open REPL : CTRL+ALT+F
  * Send selected code to REPL : CTRL+SHIFT+ENTER

The bindings I use are shown below:  


You&#8217;ll want to configure Sublime 3 [indentation settings][10] to include these options to replace Tabs with spaces; as Sharp hates your tabs.  


This setup also works on Sublime for Windows, [but you need fsi.exe][11] in your path and working with all dependencies (Windows SKD, .NET Framework etc.).

 [1]: http://search.twitter.com/search?q=%23
 [2]: http://fsharp.org/use/mac/
 [3]: http://www.sublimetext.com
 [4]: https://packagecontrol.io/installation
 [5]: https://packagecontrol.io/docs/usage
 [6]: https://packagecontrol.io/packages/F%23
 [7]: https://packagecontrol.io/packages/FSharp
 [8]: https://packagecontrol.io/packages/SublimeREPL
 [9]: https://www.sublimetext.com/docs/3/settings.html
 [10]: https://www.sublimetext.com/docs/3/indentation.html
 [11]: http://fsharp.org/use/windows/