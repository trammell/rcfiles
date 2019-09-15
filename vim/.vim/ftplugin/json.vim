" filetype plugin for smarty templates

" idempotent
if exists("b:loaded_ftplugin_smarty")
    finish
endif
let b:loaded_ftplugin_smarty = 1

setlocal autoindent
setlocal foldmethod=syntax
setlocal tabstop=4
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\ \ 
setlocal noet

let maplocalleader = ","

