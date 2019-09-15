" settings I like for restructured text

" Only do this when not done yet for this buffer
if exists("b:loaded_ftplugin_rst_jotr")
   finish
endif
let b:loaded_ftplugin_rst_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal smartindent        " do I really want this?
setlocal tabstop=4
setlocal textwidth=78
"setlocal textwidth=79
setlocal foldmethod=indent
"setlocal cursorline
"setlocal number
"setlocal foldmethod=syntax
setlocal list
setlocal listchars=trail:-,tab:\.\

