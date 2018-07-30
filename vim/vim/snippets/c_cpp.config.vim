iabbr #i #include
iabbr #d #define
" Insert comment
iabbr /* /**/<esc>F*i
" Error template
iabbr scerr <esc>:-1r! sed -n 2,5p ~/dotfiles/vim/vim/snippets/cpp/cpp-snippets.vim
iabbr scfor <esc>:-1r! sed -n 6,9p ~/dotfiles/vim/vim/snippets/cpp/cpp-snippets.vim

nnoremap <leader>2 :term sudo make install<cr>
" Go to the beginning of a function section {}
nnoremap ^ <M-[><M-{>

" Autogenerate a .h header content
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
iabbr cheader <esc>:call CHeader()

" Autogenerate a C main content
function! CMain()
    let cur_line = line('.')
    call setline(cur_line, "int main(int argc, char *argv[])")
    call setline(cur_line + 1, "{")
    call setline(cur_line + 2, "    return 0;")
    call setline(cur_line + 3, "}")
endfunction
iabbr cmain <esc>:call CMain()

iabbr cpputest <esc>:-1r ~/dotfiles/vim/vim/snippets/cpp/cpputest.template
au Filetype cpp source ~/dotfiles/vim/vim/snippets/cpp/cpputest.vim

"iabbr sniperr <esc>:r! sed -n 4,6p ~/dotfiles/vim/vim/snippets/cpp/cpp-snippets.vim

"" Show the name of the function for the current scope
fun! ShowFuncName()
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
  echohl None
endfun
nnoremap func :call ShowFuncName() <CR>


