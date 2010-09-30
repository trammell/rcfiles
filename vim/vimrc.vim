" vim: set filetype=vim "

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

" try to use syntax highlighting
syntax enable
syntax sync fromstart

" turn on highlighting of trailing spaces
set list
set listchars=trail:-,tab:\.\

" FIXME
filetype on

" unicode/encoding settings
set encoding=utf8
"set fileencodings=ucs-bom,utf-8,windows-1252,latin1
set fileencodings=ucs-bom,utf-8,latin1,windows-1252
"set bomb                       " sets BOM (byte order mark) boolean

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

" gui-specific settings
if has('gui_running')
    set guifont=Liberation_Mono_Regular:h12.00 " For GUI options
    if has("gui_macvim")
        set lines=35
        set columns=90
        set guifont=Menlo\ Regular:h16
    endif
endif

let mapleader = ","

"nmap <Leader>e :call PerlMathEval()<CR>
"nmap <Leader>h :let @/ = "" <CR>

" handy function to evaluate perl expressions
function! PerlMathEval()
perl << EOF
    $lnum = ($curwin->Cursor)[0];
    $line = $curbuf->Get($lnum);
    $line =~ s{.*=}{};
    $curbuf->Append($lnum, eval $line);
EOF
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
set whichwrap=<,>,h,l,[,]

" install pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" vim conditional source of '~/.vim/vimau.vim'
" see e.g. http://vim.wikia.com/wiki/Loading_scripts_in_vimrc_safely

if filereadable($HOME . "/.vim/vimau.vim")
  source $HOME/.vim/vimau.vim
endif
