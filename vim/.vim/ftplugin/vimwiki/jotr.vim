" idempotent
if exists("b:loaded_ftplugin_vimwiki_jotr")
   finish
endif

let b:loaded_ftplugin_vimwiki_jotr = 1

setlocal background=light
setlocal noswapfile
setlocal expandtab
setlocal tabstop=2
setlocal foldmethod=marker
setlocal textwidth=75
setlocal nolist

let maplocalleader = ","

nnoremap <leader>dm o== daily meeting ==<cr><esc>

