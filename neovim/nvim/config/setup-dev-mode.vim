" ==============================================================================
" This file contains settings and functions used when programming
" ==============================================================================

" Generic configuration
set number          " Show line numbers
set colorcolumn=0   " Show a colored line at the 81st column
"set cursorline      " Colors the current line
" Auto add closing bracket
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap {<Tab>  {}<Left>

" Align function arguments
set cino+=(0

"" Expand aliases of Bash in vimrc command line
"set shell=/bin/bash\ -i

" Command to set the current working directory
command! Sethere lcd %:p:h
nnoremap sth <Esc>:Sethere<CR>

"" Write the file with superuser privilegies
command! SudoWrite  w !sudo tee %

noremap <F4> <Esc>:make!<CR>
nnoremap <F5> <Esc>:Shell cmake ..<CR>

" Mark--Karkat (TODO dunno what it does)
vnoremap {Leader}/  n

" =============================================================================
" HTML
" =============================================================================
" closetag
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" ==============================================================================
" C/C++
" ==============================================================================
"
" CScope
"" Copy word under cursor into register. TODO: move this somewhere else
:map <F9> "zyw
command! CscopeLoadDB cs add cscope.out
nnoremap csl <Esc>:cs add cscope.out<CR>
nnoremap csc <Esc>:cs find c<space>
nnoremap csd <Esc>:cs find g<space>
nnoremap csf <Esc>:cs find f<space>
nnoremap css <Esc>:cs find s<space>


if has('cscope')
    set cscopetag cscopeverbose
    map <leader>c <Esc>:cscope find c
endif

"" Autoload cscope db if in upper directory
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()


"" Quickfix window for cscope in place of interactive window
if has('quickfix')
    set cscopequickfix=c-,d-,e-,f-,g-,i-,t-,s-
endif

"" Update cscope db
nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs kill -1<CR>:cs add cscope.out<CR>


" ==============================================================================
" Ctags
" Command to create new ctags file
command! MyCtags !ctags -R --extra=+f --fields=+lS .

"Makes ctags visible from subdirectories
set tags=tags;/

noremap T <Esc>:tag

" Move to next tag
noremap <C-[> <C-o>

" vim-easytag integration
let g:easytags_async=1
let g:easytags_on_cursorhold = 0
set tags=./tags;
let g:easytags_dynamic_files = 1

" ==============================================================================
" Folding
set foldenable
set foldmethod=syntax
set foldlevel=100

" Space opens folds, c-space closes folds
nnoremap <space> zM
nnoremap <M-space> zR
nnoremap zx za
nnoremap <leader>z zMzvzz

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
        let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
        let linenum = v:foldstart + 1
        while linenum < v:foldend
            let line = getline( linenum )
            let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
            if comment_content != ''
                break
            endif
            let linenum = linenum + 1
        endwhile
        let sub = initial . ' ' . comment_content
    else
        let sub = line
        let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
        if startbrace == '{'
            let line = getline(v:foldend)
            let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
            if endbrace == '}'
                let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
            endif
        endif
    endif
    let n = v:foldend - v:foldstart
    let info = " " . n . " lines"
    let sub = sub . "                                                                                                                  "
    let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
    let fold_w = getwinvar( 0, '&foldcolumn' )
    let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
    return sub . info
endfunction

" ==============================================================================
"" Read Manual
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  :exe ":wincmd n"
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"
  " Goto first line...
  :exe ":goto"
  " and delete it:
  :exe ":delete"
endfun
" Map the K key to the ReadMan function:
map M :call ReadMan()<CR>

" ==============================================================================
" Golang
" ==============================================================================
" Vim-go plugin
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gw <Plug>(go-doc-browser)
au FileType go nmap <Leader>gs <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ==============================================================================
" Auto shebang
augroup Shebang
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: UTF-8 -*-\<nl>\"|$
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END


" ==============================================================================
" Deoplete-clang


" ==============================================================================
" GitGutter
nnoremap gt <Esc>:GitGutterLineHighlightsToggle<CR>
