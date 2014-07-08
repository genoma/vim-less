" Originally was
" ==============
" Vim filetype plugin
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 Jul 26
"=============================================

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl cms< def< inc< inex< ofu< sua<"

setlocal formatoptions-=t formatoptions+=croql

setlocal comments=:// commentstring=//\ %s

setlocal omnifunc=csscomplete#CompleteCSS
setlocal suffixesadd=.less
