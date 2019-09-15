" vim: set filetype=vim :

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

" hide buffers instead of closing them
set hidden

" aggressively search for tags files
set tags=tags;/

" quick paste/nopaste toggling
set pastetoggle=<F2>

" remap ';' to ':'
nnoremap ; :

" FIXME
filetype on

" unicode/encoding settings
set encoding=utf8
"set fileencodings=ucs-bom,utf-8,windows-1252,latin1
set fileencodings=ucs-bom,utf-8,latin1,windows-1252

" in netrw, don't show .svn dirs
let g:netrw_listhide='\^\.svn'

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
    "set guifont=Liberation_Mono_Regular:h12.00 " For GUI options
    if has("gui_macvim")
        set lines=50
        set columns=120
        set guifont=Menlo\ Regular:h14
    endif
endif

" version-specific settings
if version >= 703
    set cryptmethod=blowfish
endif

let mapleader = ","
let maplocalleader = ","

nnoremap <Leader>e :call PerlMathEval()<CR>

"
if isdirectory("parts/omelette/")
    chdir parts/omelette/
endif


" set up a mapping to clear the search register (this clears the search
" highlighting too, and is nicer than nohlsearch)
nnoremap <Leader>h :let @/=""<CR>

" fugitive shortcuts
nnoremap <Leader>Gs :Gstatus<CR>
nnoremap <Leader>Gd :Gdiff<CR>

" nerdtree shortcuts
nnoremap <Leader>nt :NERDTree<CR>

" handy function to evaluate perl expressions
function! PerlMathEval()
perl << EOF
    my $row = ($curwin->Cursor)[0];
    my $line = $curbuf->Get($row);
    $line =~ s{^\s*(?://|#)}{};     # strip leading comment chars
    $line =~ s{=.*}{};              # strip trailing =...
    $curbuf->Append($row, eval $line);
EOF
endfunction

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" map ^N to set no-highlight-search; see http://vim.wikia.com/wiki/VimTip93
nnoremap <silent> <C-N> :silent noh<CR>

" see Vim Tip #1066: Quickly adding and deleting empty lines
" http://vim.sourceforge.net/tips/tip.php?tip_id=1066
noremap <silent><C-k> mz:silent +g/\m^\s*$/d<CR>`z:noh<CR>

set background=dark
set incsearch
" set hlsearch
colorscheme industry
set whichwrap=<,>,h,l,[,]

" install pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" NERDTree config
let NERDTreeIgnore=['\.py[co]$','\.swp$']

" fugitive status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vimwiki setup (HTML goes into "~/Dropbox/vimwiki_html")
let g:vimwiki_list = [{'path': '~/.vimwiki'}, {'path': '~/.outsell-vimwiki'}, {'path': '~/.hc-vimwiki'}]
"let g:vimwiki_folding = 1

" conditionally load defs from '~/.vim/vimau.vim'
" see e.g. http://vim.wikia.com/wiki/Loading_scripts_in_vimrc_safely
if filereadable($HOME . "/.vim/vimau.vim")
    source $HOME/.vim/vimau.vim
endif


" exercises from Learn Vimscript the Hard Way
"  echo ">^.^<"

inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@ john.trammell@gmail.com
iabbrev jsut just

set nobackup
set nowritebackup
