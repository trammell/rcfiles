" settings I like for python

" Only do this when not done yet for this buffer
if exists("b:loaded_ftplugin_python_jotr")
   finish
endif
let b:loaded_ftplugin_python_jotr = 1

setlocal autoindent
setlocal expandtab
setlocal tabstop=4
setlocal textwidth=78

" set up mappings for python
:let maplocalleader = ","

nmap <LocalLeader>f oimport pdb; pdb.set_trace()<ESC>
