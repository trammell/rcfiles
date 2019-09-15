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

let maplocalleader = ","
let perl_fold=1

function! StandardPODHeader()
    put ='=pod'                 | put =''
    put ='=head1 NAME'          | put =''
    put ='=head1 SYNOPSIS'      | put =''
    put ='=head1 DESCRIPTION'   | put =''
    put ='=cut'                 | put =''
endfunction

" mappings
nmap <LocalLeader>p :call StandardPODHeader()<CR>
nmap <LocalLeader>s iuse strict;<CR>use warnings FATAL => 'all';<CR><ESC>
