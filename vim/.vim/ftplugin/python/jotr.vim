" settings I like for python

" Only do this when not done yet for this buffer
if exists("b:loaded_ftplugin_python_jotr")
   finish
endif
let b:loaded_ftplugin_python_jotr = 1

let g:pep8_map=',p8'

" http://www.reddit.com/r/vim/comments/euon6/why_does_vims_python_default_behavior_suck_so/
"filetype plugin indent on

setlocal autoindent
setlocal expandtab
setlocal smartindent        " do I really want this?
setlocal tabstop=4
setlocal textwidth=79
"setlocal foldmethod=indent
"setlocal cursorline
"setlocal number

noremap  <buffer> <LocalLeader>pf :call Pyflakes()<CR>

" set up mappings for python
let maplocalleader = ","

nmap <LocalLeader>pdb oimport pdb; pdb.set_trace()<ESC>
nmap <LocalLeader>pf :call Pyflakes()<CR>
nmap <LocalLeader>v oimport vimpdb; vimpdb.set_trace()<ESC>
