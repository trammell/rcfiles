" vim: set filetype=vim tw=78:

set modeline
set modelines=5
set history=1000
set scrolloff=3
set grepprg=ack\ -a
set ruler
set wildmenu
set wildmode=list:longest
set ignorecase                  " ignore case differences while searching
set nocompatible                " make Vim less vi-compatible

filetype on

" unicode/encoding settings
set encoding=utf8
"set fileencodings=ucs-bom,utf-8,windows-1252,latin1
set fileencodings=ucs-bom,utf-8,latin1,windows-1252
"set bomb                       " sets BOM (byte order mark) boolean

"let perl_fold=1

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


let mapleader = ","

"nmap <Space>   /
"nmap <C-Space> ?
"imap <C-F> {<CR>}<C-O>O
"
"nmap <Leader>c i# $Id<ESC>a:$<CR># $Source<ESC>a:$<CR><ESC>
"nmap <Leader>d ma:r!date<CR>"add`ai<C-R>a<ESC><ESC>kJ

nmap <Leader>e :call PerlMathEval()<CR>
nmap <Leader>f oimport pdb; pdb.set_trace()<ESC>

"nmap <Leader>h :let @/ = "" <CR>
"nmap <Leader>i i i18n:translate=""<ESC>
"nmap <Leader>j :call FindUntranslated()<CR>
"nmap <Leader>o i tal:omit-tag=""<ESC>
"nmap <Leader>p i<CR>=pod<CR><CR>=head1 NAME<CR><CR>=head1 SYNOPSIS<CR><CR>=head1 DESCRIPTION<CR><CR>=cut<CR><ESC>
"nmap <Leader>s iuse strict;<CR>use warnings;<CR><ESC>
"nmap <Leader>S :call MakeSubScript()<CR>
"nmap <Leader>hc i2975 Lone Oak Drive, Suite 180<CR>Eagan, MN 55121-1553<CR><ESC>

"vmap <Leader>s :call s:MakeSubScript()<CR>


" handy function to evaluate perl expressions
function! PerlMathEval()
perl << EOF
    $lnum = ($curwin->Cursor)[0];
    $line = $curbuf->Get($lnum);
    $line =~ s/.*=//;
    $curbuf->Append($lnum, eval $line);
EOF
endfunction

" Refer ':help using-<Plug>'
if !hasmapto('<Plug>MakeSubScript')
    map <unique> <Leader>s <Plug>MakeSubScript
endif
noremap <unique> <script> <Plug>MakeSubScript <SID>MakeSubScript
noremap <SID>MakeSubScript :call <SID>MakeSubScript()<CR>

" handy function to convert numbers to subscripts
" see http://www.swaroopch.com/notes/Vim_en:Scripting
function! s:MakeSubScript() range
    for i in range(a:firstline, a:lastline)
        let x = tr(getline(i),"0123456789","₀₁₂₃₄₅₆₇₈₉")
        call setline(i,x)
    endfor
endfunction


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

" install pathogen
call pathogen#runtime_append_all_bundles()

" vim conditional source of '~/.vim/vimau.vim'
" see e.g. http://vim.wikia.com/wiki/Loading_scripts_in_vimrc_safely

if filereadable($HOME . "/.vim/vimau.vim")
    source $HOME/.vim/vimau.vim
endif

" gui-specific settings
if has('gui_running')
    set guifont=Liberation_Mono_Regular:h12.00 " For GUI options
    if has("gui_macvim")
        set lines=35
        set columns=90
        set guifont=Menlo\ Regular:h16
        "map <leader>t <Plug>PeepOpen  " For MacVim specific settings
    endif
endif
