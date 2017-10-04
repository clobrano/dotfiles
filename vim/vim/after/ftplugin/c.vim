" Cmake: call make in a cmake based build env
function! CallCmake()
    if !empty(glob("./build"))
        cd build
    else
    endif
    make
    cd -
endfunction
command! Cmake :call CallCmake()
cabbr cmake Cmake

" Show GTK documentation
nmap <silent> <leader>gdoc :! devhelp -s "<cword>" &<CR><CR>

" Astyle: use Astyle to format current file
function! Astyle()
    if !empty(glob("./astyle.options"))
        execute "!" . "astyle --options=astyle.options %"
    else
        echo "could not find astyle.options"
    endif
endfunction
command! Astyle :call Astyle()
cabbr astyle Astyle

" Clang-format uses clang-format to fix current file format
" based on a .clang-format file in project root directory
function! ClangFormat() range
    if !empty(glob("./.clang-format"))
        if a:firstline != a:lastline
            execute "!" . "clang-format -lines=" . a:firstline . ":" . a:lastline ." -i %"
        else
            execute "!" . "clang-format -i %"
        endif
    else
        echo "could not find .clang-format file"
    endif
endfunction
command! -range ClangFormat :call ClangFormat()
vnoremap <leader>clf :call ClangFormat()<CR>
cabbr clangformat call ClangFormat()
