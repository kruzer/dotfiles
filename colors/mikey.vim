" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mikey"
" My colors for status line:
hi User1 ctermfg=2  ctermbg=5
hi User2 ctermfg=8  ctermbg=6
hi User3 ctermfg=7  ctermbg=8
hi User4 ctermfg=6  ctermbg=4
hi User5 ctermfg=5  ctermbg=3
hi User6 ctermfg=4  ctermbg=2
hi User7 ctermfg=3  ctermbg=0
hi User8 ctermfg=1  ctermbg=1
hi User9 ctermfg=0  ctermbg=5

" vim: sw=2
