" settings I like for XML

" Only do this when not done yet for this buffer
if exists("b:loaded_ftplugin_xml_jotr")
   finish
endif
let b:loaded_ftplugin_xml_jotr = 1

" turn on syntax folding
let g:xml_syntax_folding = 1
set foldmethod=syntax
"setlocal foldmethod=marker

"setlocal autoindent
setlocal expandtab
setlocal tabstop=2
setlocal textwidth=999

" i18ndude/find-untranslated helper
function! FindUntranslated()
   let curfile = bufname("%")
   let tmpfile = tempname()
   silent execute "write! " . tmpfile
   let output = system("i18ndude find-untranslated " . tmpfile . " 2>&1")
   if output != ''
      " Make sure the output specifies the correct filename
      let output = substitute(output, fnameescape(tmpfile), fnameescape(curfile), "g")
      echo output
   endif
endfunction

" set up mappings
:let maplocalleader = ","

nmap <LocalLeader>i i i18n:translate=""<ESC>
nmap <LocalLeader>o i tal:omit-tag=""<ESC>
nmap <LocalLeader>u :call FindUntranslated()<CR>
