" Astyle
function! Astyle()
    if !empty(glob("./astyle.options"))
        execute "!" . "astyle --options=astyle.options %"
    else
        echo "could not find astyle.options"
    endif
endfunction
command! Astyle :call Astyle()
iabbr astyle Astyle

" Cmake
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


