" filetype plugin for Lua

" idempotent
if exists("b:loaded_ftplugin_lua")
    finish
endif
let b:loaded_ftplugin_lua = 1

setlocal autoindent
setlocal expandtab
setlocal foldmethod=syntax
setlocal tabstop=3
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\ \ 
setlocal noet

let maplocalleader = ","

