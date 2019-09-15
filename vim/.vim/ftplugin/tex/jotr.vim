" my filetype plugin for TeX, LaTeX, ...

" idempotent
if exists("b:loaded_ftplugin_tex_jotr")
   finish
endif
let b:loaded_ftplugin_tex_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal foldmethod=marker
setlocal tabstop=4
setlocal textwidth=75
setlocal list
setlocal listchars=trail:-,tab:\.\

let maplocalleader = ","
