# hp-41_vim
## HP-41: Syntax and filetype plugin

### VIM syntax highlighting for HP-41 program files (\*.41)

The HP-41 syntax highlighting goes well with the HP-41 file type plugin to facilitate easy writing of HP-41 programs in VIM. 

#### Install details
Drop the hp41.vim syntax file into your .vim/syntax/ directory and register the file globally or add to your .vimrc file: 

`autocmd BufRead,BufNewFile *.41 :source ~/.vim/syntax/hp41.vim`

Then all files with the .41 extesion will be highlighted appropriately.

### VIM filetype plugin for HP-41 program files (\*.41)

This ftplugin has the following features: 

Auto-line-numbering: Upon pressing <CR> after a line, the next line has the correct line number. It even renumbers the whole file automatically. So, if you add new lines in the middle of a program, it renumbers the whole file. If you delete a line, just hit Enter to renumber the file (either in Normal or Insert mode) 
Also, abbreviations of usual commands: 
```
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
```
You can jump to a numeric LBL if you have the cursor on a line with a numeric GTO or XEQ and press "gL".

#### Install details
Drop the hp41.vim syntax file into your .vim/ftplugin/ directory and register the file globally or add to your .vimrc file: 

`autocmd BufRead,BufNewFile *.41 :source ~/.vim/ftplugin/hp41.vim`

...and you are ready for easy HP-41 program writing.
