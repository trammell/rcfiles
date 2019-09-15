" my filetype plugin for PHP

" idempotent
if exists("b:loaded_ftplugin_php_jotr")
    finish
endif
let b:loaded_ftplugin_php_jotr = 1

setlocal autoindent
setlocal noexpandtab
setlocal foldmethod=syntax
setlocal nolist
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=80

let maplocalleader = ","

setlocal formatoptions=coqr
setlocal comments+=sr:/*,mb:*,ex:*/,b:#


" simple syntax checker
nmap <LocalLeader>sy :!php -l %<CR>


" syntax highlighting to show non-tab whitespace before text (up to 3
" characters of space after the tabs are OK)
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /^\t*\zs \{4,}\ze[^\t ]/
match ExtraWhiteSpace /\s\+$/

