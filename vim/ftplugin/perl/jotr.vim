" my filetype plugin for Perl

" idempotent
if exists("b:loaded_ftplugin_perl_jotr")
   finish
endif
let b:loaded_ftplugin_perl_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal foldmethod=syntax
setlocal tabstop=4
setlocal textwidth=78
setlocal list
setlocal listchars=trail:-,tab:\.\

:let maplocalleader = ","
:let perl_fold=1

" mappings
" FIXME: can we wrap this long line somehow?
nmap <LocalLeader>p i<CR>=pod<CR><CR>=head1 NAME<CR><CR>=head1 SYNOPSIS<CR><CR>=head1 DESCRIPTION<CR><CR>=cut<CR><ESC>
nmap <LocalLeader>s iuse strict;<CR>use warnings;<CR><ESC>
