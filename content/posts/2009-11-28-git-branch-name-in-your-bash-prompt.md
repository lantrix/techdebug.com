---
title: Git branch name in your bash prompt
author: Tech Debug
type: post
date: 2009-11-28T03:51:35+00:00
url: /blog/2009/11/28/git-branch-name-in-your-bash-prompt/
categories:
  - git
tags:
  - gist
  - git
  - SCM

---
Here is a quick way to show the current [git][1] branch when you are in a repository directory. Place this in your .bashrc or .bash_profile:

I&#8217;ve also customised the PS1 to show user/host/path.

You should probably setup git bash completion as well. This can be done by sourcing the [bash completion script][2] that is available in the git source code as shown (change path to where you place script):

Have fun.

 [1]: http://git-scm.com/
 [2]: http://git.kernel.org/?p=git/git.git;a=blob;f=contrib/completion/git-completion.bash;hb=HEAD