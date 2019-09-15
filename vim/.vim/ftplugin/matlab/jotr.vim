" my filetype plugin for MATLAB

" idempotent
if exists("b:loaded_ftplugin_matlab_jotr")
   finish
endif
let b:loaded_ftplugin_matlab_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal tabstop=4
setlocal textwidth=60
setlocal list
setlocal listchars=trail:-,tab:\.\

let maplocalleader = ","
