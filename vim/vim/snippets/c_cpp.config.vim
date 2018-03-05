iabbr #i #include
iabbr #d #define
" Insert comment
iabbr /* /**/<esc>F*i

" Go to the beginning of a function section {}
nnoremap ^ <M-[><M-{>

function! CHeader()
    let filename = expand('%:t')
    let headername = toupper(filename)
    let headername = substitute(headername, "-", "_", "")
    let headername = substitute(headername, "\\.", "_", "")
    let headername = "_" . headername . "_"
    let cur_line = line('.')
    call setline(cur_line, "#ifndef " . headername)
    call setline(cur_line + 1, "#define " . headername)
    call setline(cur_line + 2, "")
    call setline(cur_line + 3, "#endif /* " . headername . " */")
endfunction
iabbr cguard <esc>:call CHeader()

iabbr cpputest <esc>:-1r~/dotfiles/vim/vim/snippets/cpp/cpputest.template
au Filetype cpp source ~/dotfiles/vim/vim/snippets/cpp/cpputest.vim
