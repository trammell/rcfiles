" filetype plugin for Java

" idempotent
if exists("b:loaded_ftplugin_java")
    finish
endif
let b:loaded_ftplugin_java = 1

setlocal autoindent
setlocal foldmethod=syntax
setlocal tabstop=4
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\ \ 
setlocal noet

let maplocalleader = ","

