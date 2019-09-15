" my filetype plugin for C

" idempotent
if exists("b:loaded_ftplugin_c_jotr")
   finish
endif
let b:loaded_ftplugin_c_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal foldmethod=syntax
setlocal tabstop=4
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\.\

let maplocalleader = ","

function! StandardCHeader()
    put =' * Author   : John Trammell <johntrammell@gmail.com>'
    put =' * Section  : 0004'
    put =strftime(' * Date     : %Y-%m-%d')
endfunction

" mappings
nmap <LocalLeader>h :call StandardCHeader()<CR>
nmap <LocalLeader>e :call PerlMathEval()<CR>

