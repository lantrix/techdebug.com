---
title: Vim Split tips
author: Tech Debug
type: post
date: 2008-05-21T23:16:30+00:00
url: /blog/2008/05/22/vim-split-tips/
tags:
  - diff
  - split
  - tips
  - unix
  - vim
categories:
  - apps
  - unix

---
I use vim a lot of the time, mostly with splits and diffs, so the following key mappings and functions really helped me with managing the split windows. Maybe they will help you too. (Thanks to the [Vim tips wiki][1] for these).

  * If you use vertical splits, this will help move left and right across the split. Put in your ~/.vimrc  
    `<br />
" Map multi window keys<br />
set wmw=0<br />
" CTRL-H move to left window<br />
nmap <c -h> </c><c -w>h</c><c -w><bar><br />
" CTRL-L move to right window<br />
nmap <c -l> </c><c -w>l</c><c -w><bar><br />
</bar></c></bar></c>`
  * When scrolling up and down a window, you can use zz to jump the current line to the middle of the window. If you want this on always ala **Scroll locking**, then you can use this function. It is a toggle option. use \zz to toggle it. Put in your ~/.vimrc  
    `<br />
" Map \zz to lock scroll to middle of window<br />
map <leader>zz :let &scrolloff=999-&scrolloff<cr><br />
</cr></leader>`
  * In a window split (of any sort) if you want to maximise to the current window, this will do it for you. When you press CTRL-W then o it will maximise the current view, then when pressed again will return your split arrangement! Put in your ~/.vimrc  
    `<br />
" Max/unmax splits<br />
nnoremap <c -W>O :call MaximizeToggle ()<cr><br />
nnoremap <c -W>o :call MaximizeToggle ()<cr><br />
nnoremap <c -W></c><c -O> :call MaximizeToggle ()<cr></p>
<p>function! MaximizeToggle()<br />
  if exists("s:maximize_session")<br />
    exec "source " . s:maximize_session<br />
    call delete(s:maximize_session)<br />
    unlet s:maximize_session<br />
    let &hidden=s:maximize_hidden_save<br />
    unlet s:maximize_hidden_save<br />
  else<br />
    let s:maximize_hidden_save = &hidden<br />
    let s:maximize_session = tempname()<br />
    set hidden<br />
    exec "mksession! " . s:maximize_session<br />
    only<br />
  endif<br />
endfunction<br />
</cr></c></cr></c></cr></c>`

 [1]: http://vim.wikia.com/wiki/Main_Page