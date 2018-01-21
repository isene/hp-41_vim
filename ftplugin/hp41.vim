" Vim filetype plugin
" Language:     HP-41
" Version:	0.8.3
" Maintainer:   Geir Isene
" Last Change:  2012-02-05
" URL:          http://isene.com/

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
    finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

set nrformats-=octal

map <CR> :call Renumber()<CR>
imap <CR> <CR><C-Y><C-Y><C-Y><SPACE><ESC>0<C-A>:call Renumber()<CR>A
iab av AVIEW
iab ar ARCL 
iab as ASTO 
iab en ENTER
iab gt GTO 
iab ge GETREC
iab lb LBL 
iab pr PROMPT
iab sa SAVEREC
iab st STO 
iab rc RCL 
iab vi VIEW
iab xe XEQ 
iab <> X<>Y
iab . STOP

if !exists("*s:Renumber")
  function Renumber()
		let s:linenumber = line(".")
		let s:colnumber = col(".")
		exe "normal gg"
		exe search("001")
		let s:linestart = line(".")
		let s:colstart = col(".")
		call cursor(s:linestart,s:colstart)
		let @r = 1
    exe "normal 0cw".printf("%03d", @r)
		2,$s#^\d\d\d#\=printf("%03d", @r + setreg('r', @r+1))#
		call cursor(s:linenumber,s:colnumber)
    endfunction
endif
