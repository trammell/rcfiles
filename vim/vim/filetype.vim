" vim: set filetype=vim et ts=3 :
" set up custom file types

augroup filetypedetect

   au BufRead,BufNewFile *.cfg            set filetype=dosini
   au BufRead,BufNewFile *.js             set filetype=javascript
   au BufRead,BufNewFile Makefile         set filetype=make
   au BufRead,BufNewFile autohandler      set filetype=mason
   au BufRead,BufNewFile dhandler         set filetype=mason
   au BufRead,BufNewFile *.ma             set filetype=mason
   au BufRead,BufNewFile *.mas            set filetype=mason
   au BufRead,BufNewFile *.html           set filetype=mason
   au BufRead,BufNewFile *.htm            set filetype=mason
   au BufRead,BufNewFile *.json           set filetype=json
   au BufRead,BufNewFile *.pt             set filetype=xml
   au BufRead,BufNewFile *.R              set filetype=R
   au BufRead,BufNewFile *.t              set filetype=perl
   au BufRead,BufNewFile *.sh             set filetype=shell
   au BufRead,BufNewFile *rc              set filetype=rc
   au BufRead,BufNewFile *.sql            set filetype=sql
   au BufRead,BufNewFile *.tt             set filetype=tt2
   au BufRead,BufNewFile *.tt2            set filetype=tt2
   au BufRead,BufNewFile *.txt            set filetype=text
   au BufRead,BufNewFile *.yaml           set filetype=yaml
   au BufRead,BufNewFile *.zcml           set filetype=xml
   au BufRead,BufNewFile README*          set filetype=text
   au BufRead,BufNewFile Changes*         set filetype=text
   au BufRead,BufNewFile version.txt      set filetype=plonever
   au BufRead,BufNewFile *.djt            set filetype=htmldjango
   au BufRead,BufNewFile *.css.dtml       set filetype=css

augroup END
