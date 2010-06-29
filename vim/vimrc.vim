" first things first
"
set modeline
set history=1000
set scrolloff=3
set grepprg=ack\ -a
set ruler
set wildmenu
set wildmode=list:longest

filetype on

"let perl_fold=1

" things for unicode
set encoding=utf8
"set fileencodings=ucs-bom,utf-8,windows-1252,latin1
set fileencodings=ucs-bom,utf-8,latin1,windows-1252

"set bomb    " sets BOM (byte order mark) boolean

if &term =~ "xterm"
    if has("terminfo")
      set t_Co=8
      set t_Sf=<Esc>[3%p1%dm
      set t_Sb=<Esc>[4%p1%dm
   else
      set t_Co=8
      set t_Sf=<Esc>[3%dm
      set t_Sb=<Esc>[4%dm
   endif
endif

" ignore case differences while searching
set ignorecase

"let mapleader = ","

"nmap <Space>   /
"nmap <C-Space> ?
"imap <C-F> {<CR>}<C-O>O
"
"nmap <Leader>c i# $Id<ESC>a:$<CR># $Source<ESC>a:$<CR><ESC>
"nmap <Leader>d ma:r!date<CR>"add`ai<C-R>a<ESC><ESC>kJ
"nmap <Leader>e :call PerlMathEval()<CR>
"nmap <Leader>f oimport pdb; pdb.set_trace()<ESC>
"nmap <Leader>h :let @/ = "" <CR>
"nmap <Leader>i i i18n:translate=""<ESC>
"nmap <Leader>j :call FindUntranslated()<CR>
"nmap <Leader>o i tal:omit-tag=""<ESC>
"nmap <Leader>p i<CR>=pod<CR><CR>=head1 NAME<CR><CR>=head1 SYNOPSIS<CR><CR>=head1 DESCRIPTION<CR><CR>=cut<CR><ESC>
"nmap <Leader>s iuse strict;<CR>use warnings;<CR><ESC>
"vmap <Leader>t !perltidy
"nmap <Leader>S :call MakeSubScript()<CR>
"nmap <Leader>hc i2975 Lone Oak Drive, Suite 180<CR>Eagan, MN 55121-1553<CR><ESC>

"vmap \s :call MakeSubScript()<CR>
"

"map <F2> :echo 'Current time = ' . strftime('%c')<CR>

" handy function to evaluate perl expressions
function! PerlMathEval()
perl << EOF
    $lnum = ($curwin->Cursor)[0];
    $line = $curbuf->Get($lnum);
    $line =~ s/.*=//;
    $curbuf->Append($lnum, eval $line);
EOF
endfunction


" handy function to evaluate perl expressions
function! MakeSubScript()
perl << EOF
    $lnum = ($curwin->Cursor)[0];
    $curbuf->Append($lnum, "₁");
EOF
endfunction


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

" map ^N to set no-highlight-search; see http://vim.wikia.com/wiki/VimTip93
nmap <silent> <C-N> :silent noh<CR>

" see Vim Tip #1066: Quickly adding and deleting empty lines
" http://vim.sourceforge.net/tips/tip.php?tip_id=1066
noremap <silent><C-k> mz:silent +g/\m^\s*$/d<CR>`z:noh<CR>


set background=dark
set incsearch
" set hlsearch
colorscheme elflord
syntax enable
syntax sync fromstart

set whichwrap=<,>,h,l,[,]

" turn on highlighting of trailing spaces
set list
set listchars=trail:-,tab:\.\


" set folding to use file syntax
set foldmethod=syntax


" vim conditional source of '~/.vim/vimau.vim'

source ~/.vim/vimau.vim

