" Vim syntax file
" Language:	HP-41 FOCAL program listings
" Version:	1.0
" Maintainer:	Geir Isene
" Last Change:	2026-11-24
" Filenames:	*.41
" URL:		https://github.com/isene/hp-41_vim
"
" Each step gets the colour of what it does: labels gold, jumps purple,
" stops red, tests orange, registers and flags blue, text green, numbers
" cyan. The dm41 program (github.com/isene/dm41) uses the same colours.

if exists("b:current_syntax")
  finish
endif

" A step starts after the line number, if there is one.
let s:at = '\%(^\s*\d*\s*\)\@<='
let s:end = '\ze\s*\%(;\|$\)'

syntax match hp41LineNumber #^\s*\d\+#
exe 'syntax match hp41Test   #' . s:at . '\%(\S*?\S*\|ISG\|DSE\)\%(\s\|$\)[^;]*#'
exe 'syntax match hp41Memory #' . s:at . '\%(STO\|RCL\|ST[-+*/]\|X<>\|ARCL\|ASTO\|VIEW\|SF\|CF\)\s[^;]*#'
exe 'syntax match hp41Jump   #' . s:at . '\%(GTO\|XEQ\)\s[^;]*#'
exe 'syntax match hp41Stop   #' . s:at . '\%(RTN\|END\|\.END\.\|STOP\|PROMPT\|OFF\)' . s:end . '#'
exe 'syntax match hp41Xrom   #' . s:at . 'XROM\s[^;]*#'
exe 'syntax match hp41Number #' . s:at . '-\=\%(\d\+\.\=\d*\|\.\d\+\)\%(E-\=\d*\)\=' . s:end . '#'
exe 'syntax match hp41Number #' . s:at . 'E-\=\d\+' . s:end . '#'
exe 'syntax match hp41Alpha  #' . s:at . '>\="[^"]*"\=#'
exe 'syntax match hp41Label  #' . s:at . '\*\=LBL\s[^;]*#'
syntax match hp41Comment #;.*#

" Dark and light terminals get the same colours, darker on a light one.
if &background == "light"
  hi def hp41LineNumber ctermfg=244 guifg=#808080
  hi def hp41Label      ctermfg=136 cterm=bold guifg=#af8700 gui=bold
  hi def hp41Jump       ctermfg=92  guifg=#8700d7
  hi def hp41Stop       ctermfg=160 guifg=#d70000
  hi def hp41Test       ctermfg=166 guifg=#d75f00
  hi def hp41Memory     ctermfg=25  guifg=#005faf
  hi def hp41Alpha      ctermfg=28  guifg=#008700
  hi def hp41Number     ctermfg=31  guifg=#0087af
  hi def hp41Xrom       ctermfg=244 guifg=#808080
  hi def hp41Comment    ctermfg=244 cterm=italic guifg=#808080 gui=italic
else
  hi def hp41LineNumber ctermfg=244 guifg=#808080
  hi def hp41Label      ctermfg=178 cterm=bold guifg=#d7af00 gui=bold
  hi def hp41Jump       ctermfg=177 guifg=#d787ff
  hi def hp41Stop       ctermfg=203 guifg=#ff5f5f
  hi def hp41Test       ctermfg=208 guifg=#ff8700
  hi def hp41Memory     ctermfg=111 guifg=#87afff
  hi def hp41Alpha      ctermfg=114 guifg=#87d787
  hi def hp41Number     ctermfg=81  guifg=#5fd7ff
  hi def hp41Xrom       ctermfg=244 guifg=#808080
  hi def hp41Comment    ctermfg=244 cterm=italic guifg=#808080 gui=italic
endif

let b:current_syntax = "hp41"
