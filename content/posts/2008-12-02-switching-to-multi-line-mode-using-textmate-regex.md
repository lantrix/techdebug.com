---
title: Switching to multi-line mode using Textmate Regex
author: Tech Debug
type: post
date: 2008-12-02T12:57:53+00:00
url: /blog/2008/12/02/switching-to-multi-line-mode-using-textmate-regex/
categories:
  - apps
  - mac
  - regex
  - tech
tags:
  - mac
  - multiline
  - regex
  - textmate

---
So you have a pattern you want to match across multiple lines, and you have a regular expression that matches it.  
You will probably be used to doing this in perl like this:  
`/some.+?stuff/s`  
or using [regex in ruby][1] like this:  
`/some.+?stuff/m`  
However you have just started to get used to Textmate as an editor and you see it supports regex matching. Why though does it not use /s or /m for multi-line dot matching? The reason is that Textmate uses the Oniguruma regular expression library. Oniguruma requires switching to multi-line mode by using an extended group (?m:) so the dot matches the new line as well. So our pattern would be:  
`(?m:some.+?stuff)`  
Essentially doing this turns multi-line on for the sub-expression, being _some.+?stuff_  
Make sense? I thought not. Read [on about Textmate Regex][2] for more information.

 [1]: http://www.regular-expressions.info/ruby.html "Ruby Regexp Class - Regular Expressions in Ruby"
 [2]: http://manual.macromates.com/en/regular_expressions "TextMate Manual » Regular Expressions"