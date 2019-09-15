filetype on             " enable filetype detection
filetype plugin on      " enable filetype-specific plugins

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " When editing a file, always jump to the last cursor position
      autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
endif

" set up custom file types

augroup filetypedetect

   au BufRead,BufNewFile *.cfg         set filetype=dosini
   au BufRead,BufNewFile *.js          set filetype=javascript
   au BufRead,BufNewFile Makefile      set filetype=make
   au BufRead,BufNewFile autohandler   set filetype=mason
   au BufRead,BufNewFile dhandler      set filetype=mason
   au BufRead,BufNewFile *.ma          set filetype=mason
   au BufRead,BufNewFile *.mas         set filetype=mason
   au BufRead,BufNewFile *.html        set filetype=mason
   au BufRead,BufNewFile *.htm         set filetype=mason
   au BufRead,BufNewFile *.json        set filetype=json
   au BufRead,BufNewFile *.pt          set filetype=xml
   au BufRead,BufNewFile *.R           set filetype=R
   au BufRead,BufNewFile *.t           set filetype=perl
   au BufRead,BufNewFile *.sh          set filetype=shell
   au BufRead,BufNewFile *rc           set filetype=rc
   au BufRead,BufNewFile *.sql         set filetype=sql
   au BufRead,BufNewFile *.tt          set filetype=tt2
   au BufRead,BufNewFile *.tt2         set filetype=tt2
   au BufRead,BufNewFile *.txt         set filetype=text
   au BufRead,BufNewFile *.yaml        set filetype=yaml
   au BufRead,BufNewFile *.zcml        set filetype=xml
   au BufRead,BufNewFile README*       set filetype=text
   au BufRead,BufNewFile Changes*      set filetype=text
   au BufRead,BufNewFile version.txt   set filetype=plonever
   au BufRead,BufNewFile *.djt         set filetype=htmldjango
   au BufRead,BufNewFile *.css.dtml    set filetype=css
   au BufNewFile,BufRead *.R           setf r
   au BufNewFile,BufRead *.R           set syntax=r
   au BufNewFile,BufRead *.t           set tw=200

" autocommands to convert any leading spaces to tabs
" autocmd BufReadPost,FileReadPost,FileWritePre *.php %!unexpand -t 4 --first-only %


augroup END

autocmd BufNewFile *.html    0read ~/.vim/templates/template.ma
autocmd BufNewFile *.ma      0read ~/.vim/templates/template.ma
autocmd BufNewFile makefile  0read ~/.vim/templates/template.make
autocmd BufNewFile Makefile  0read ~/.vim/templates/template.make
autocmd BufNewFile *.mas     0read ~/.vim/templates/template.ma
autocmd BufNewFile *.php     0read ~/.vim/templates/template.php
autocmd BufNewFile *.pl      0read ~/.vim/templates/template.pl
autocmd BufNewFile *.pm      0read ~/.vim/templates/template.pm
autocmd BufNewFile *.py      0read ~/.vim/templates/template.py
autocmd BufNewFile README*   0read ~/.vim/templates/template.README
autocmd BufNewFile *.R       0read ~/.vim/templates/template.R
autocmd BufNewFile *.sql     0read ~/.vim/templates/template.sql
autocmd BufNewFile *.t       0read ~/.vim/templates/template.t
autocmd BufNewFile *.txt     0read ~/.vim/templates/template.txt

autocmd FileType cpp          set ai et ts=4 tw=78
autocmd FileType css          set ai et ts=4
autocmd FileType dosini       set ai et ts=4
autocmd FileType javascript   set ai et ts=4
autocmd FileType json         set ai et ts=3
autocmd FileType pod          set ai et ts=4 tw=78
autocmd FileType mason        set ai et ts=4
autocmd FileType make         set ts=4
autocmd FileType rc           set ai et ts=4
autocmd FileType R            set ai et ts=4 tw=75
autocmd FileType scheme       set ai et ts=3 tw=78 lisp
autocmd FileType shell        set ai et ts=4
autocmd FileType sql          set ai et ts=4 tw=75
autocmd FileType text         set ai et ts=3 tw=75 foldmethod=marker
autocmd FileType tt2          set ai et ts=3 tw=65
autocmd FileType vim          set ai et ts=4 tw=78
autocmd FileType yaml         set ai et ts=3 tw=75
autocmd FileType html         set ai et ts=2 foldmethod=marker tw=78
autocmd FileType xhtml        set ai et ts=2 foldmethod=marker
autocmd FileType htmldjango   set ai et ts=2 foldmethod=marker tw=78
autocmd FileType plonever     set binary noeol
