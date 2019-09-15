" filetype plugin for JSON files

" idempotent
if exists("b:loaded_ftplugin_json")
    finish
endif
let b:loaded_ftplugin_json = 1

setlocal autoindent
setlocal foldmethod=syntax
setlocal tabstop=3
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\ \ 
setlocal noet

let maplocalleader = ","

