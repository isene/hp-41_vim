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

if !exists("*GTOLBL") 
  function! GTOLBL()
    let current_line = getline('.')
    if match(current_line,'GTO \d\d') >= 0
      let ref_lbl = matchstr(current_line,"GTO [0-9][0-9]")
      let ref_lbl = substitute(ref_lbl, "GTO", 'LBL', 'g')
      call search(ref_lbl)
      let new_line = getline('.')
      if new_line == current_line
        echo "No such LBL"
      endif
		elseif match(current_line,'XEQ \d\d') >= 0
      let ref_lbl = matchstr(current_line,"XEQ [0-9][0-9]")
      let ref_lbl = substitute(ref_lbl, "XEQ", 'LBL', 'g')
      call search(ref_lbl)
      let new_line = getline('.')
      if new_line == current_line
        echo "No such LBL"
      endif
    else
      echo "No valid LBL referenced"
    endif
  endfunction
endif

nmap gL m':call GTOLBL()<CR>
