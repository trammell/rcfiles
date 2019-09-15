" Downloaded from http://www.vim.org/scripts/script.php?script_id=2914
" To change mapping, just put let g:pep8_map='whatever' in your .vimrc.
" In the quickfix window, the 'c' character closes the window.

function! PEP8()
    set lazyredraw
    cclose  " close any open quickfix window

    " reset grep options to defaults, but save old versions
    let l:grepformat_save  = &grepformat
    let l:grepprogram_save = &grepprg
    set grepformat&vim
    set grepformat&vim

    " set up grep to work with pep8
    let &grepformat = '%f:%l:%m'
    let &grepprg = 'pep8 --repeat'

    if &readonly == 0 | update | endif      " what does this accomplish?
    silent! grep! %

    "====[ Reset grep commands ]===="
    let &grepformat = l:grepformat_save
    let &grepprg    = l:grepprogram_save

    "====[ calculate & set correct window height ]===="

    let l:mod_total = 0
    let l:win_count = 1
    windo let l:win_count = l:win_count + 1
    if l:win_count <= 2 | let l:win_count = 4 | endif

    windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
          \ execute 'resize +' . l:mod_total

    " open error window
    execute 'belowright copen ' . l:mod_total
    nnoremap <buffer> <silent> c :cclose<CR>
    set nolazyredraw
    redraw!
    let tlist=getqflist() ", 'get(v:val, ''bufnr'')')
    if empty(tlist)
        if !hlexists('GreenBar')
            hi GreenBar term=reverse ctermfg=white ctermbg=darkgreen guifg=white guibg=darkgreen
        endif
        echohl GreenBar
        echomsg "PEP8 correct"
        echohl None
        cclose
    endif
endfunction


if !exists('g:pep8_map')
    let g:pep8_map=',p8'
endif
if (!hasmapto('<SID>PEP8()') && (maparg(g:pep8_map) == ''))
    exe 'nnoremap <silent> '. g:pep8_map .' :call <SID>Pep8()<CR>'
else
    if (!has("gui_running") || has("win32"))
        echo "Python PEP8 Error: No Key mapped.\n".
            \ g:pep8_map ." is taken and a replacement was not assigned."
    endif
endif
