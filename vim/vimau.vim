filetype on                 " enables filetype detection
filetype plugin on          " enables filetype-specific plugins

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
au BufRead,BufNewFile *.py          set filetype=python
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

autocmd BufNewFile *.html    0read ~/.vim/templates/template.ma
autocmd BufNewFile *.ma      0read ~/.vim/templates/template.ma
autocmd BufNewFile makefile  0read ~/.vim/templates/template.make
autocmd BufNewFile Makefile  0read ~/.vim/templates/template.make
autocmd BufNewFile *.mas     0read ~/.vim/templates/template.ma
autocmd BufNewFile *.pl      0read ~/.vim/templates/template.pl
autocmd BufNewFile *.pm      0read ~/.vim/templates/template.pm
autocmd BufNewFile *.py      0read ~/.vim/templates/template.py
autocmd BufNewFile README*   0read ~/.vim/templates/template.README
autocmd BufNewFile *.R       0read ~/.vim/templates/template.R
autocmd BufNewFile *.sql     0read ~/.vim/templates/template.sql
autocmd BufNewFile *.t       0read ~/.vim/templates/template.t
autocmd BufNewFile *.txt     0read ~/.vim/templates/template.txt

autocmd BufWritePre *.cfg   :%s/\s\+$//e
autocmd BufWritePre *.php   :%s/\s\+$//e
autocmd BufWritePre *.py    :%s/\s\+$//e
autocmd BufWritePre *.pm    :%s/\s\+$//e
autocmd BufWritePre *.pl    :%s/\s\+$//e
autocmd BufWritePre *.pt    :%s/\s\+$//e
autocmd BufWritePre *.scm   :%s/\s\+$//e
autocmd BufWritePre *.sql   :%s/\s\+$//e
autocmd BufWritePre *.t     :%s/\s\+$//e
autocmd BufWritePre *.tt2   :%s/\s\+$//e
autocmd BufWritePre *.txt   :%s/\s\+$//e
autocmd BufWritePre *.zcml  :%s/\s\+$//e
autocmd BufWritePre .vimrc  :%s/\s\+$//e

autocmd FileType cpp          set ai et ts=4 tw=78
autocmd FileType css          set ai et ts=4
autocmd FileType dosini       set ai et ts=4
autocmd FileType javascript   set ai et ts=4
autocmd FileType json         set ai et ts=3
autocmd FileType perl         set ai et ts=4 tw=78
autocmd FileType pod          set ai et ts=4 tw=78
autocmd FileType php          set ai et ts=4 foldmethod=marker
autocmd FileType mason        set ai et ts=4
autocmd FileType make         set ts=4
autocmd FileType python       set ai et ts=4 tw=78
autocmd FileType rc           set ai et ts=4
autocmd FileType R            set ai et ts=4 tw=75
autocmd FileType scheme       set ai et ts=3 tw=78 lisp
autocmd FileType shell        set ai et ts=4
autocmd FileType sql          set ai et ts=4 tw=75
autocmd FileType text         set ai et ts=3 tw=75 foldmethod=marker
autocmd FileType tt2          set ai et ts=3 tw=65
autocmd FileType yaml         set ai et ts=2 tw=75

autocmd FileType html         set ai et ts=2 foldmethod=marker tw=78
autocmd FileType xhtml        set ai et ts=2 foldmethod=marker
autocmd FileType xml          set ai et ts=2 foldmethod=marker tw=999
autocmd FileType htmldjango   set ai et ts=2 foldmethod=marker tw=78

autocmd FileType plonever     set binary noeol

