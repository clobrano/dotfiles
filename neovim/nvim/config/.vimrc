scriptencoding utf-8
set encoding=utf-8

" ==========================================================================================
" Vim-plug manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
call plug#begin()
source ~/.vim/config/vim-plug-plugins.vim
call plug#end()
" ==========================================================================================

set nocompatible
filetype on                             " After all the bundle, we can set back filetype on
set hidden                              " allows buffer to be hidden when not already saved

"" Reload vimrc
command! Vinit so ~/.vimrc
inoremap qq <Esc>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Quickfix configuration
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

source ~/.vim/config/buffers.vim
source ~/.vim/config/look-and-feel.vim
source ~/.vim/config/search-and-replace.vim
source ~/.vim/config/setup-airline.vim
source ~/.vim/config/setup-dev-mode.vim
source ~/.vim/config/setup-markdown.vim
source ~/.vim/config/setup-neocomplete.vim
source ~/.vim/config/setup-nerdtree.vim
source ~/.vim/config/setup-rst.vim
source ~/.vim/config/setup-tagbar.vim
source ~/.vim/config/setup-vala.vim
source ~/.vim/config/text-changers.vim
source ~/.vim/config/vimwiki.vim

"" Set todo.txt file syntax and colorscheme
au BufRead,BufNewFile todo.txt set filetype=todo
au BufRead,BufNewFile todo.txt Tcd ~/Documents/Telit/todo.txt-cli/notes

nmap <F1> <Esc>:Goyo<CR>


" Testing command to count TODOs in vimwiki
"fun! ToBeDone (path)
"    execute 'read !grep -rin "* \[ \]" ' a:path '| wc -l '
"endfun!
"command! -nargs=* Tbd call ToBeDone(<f-args>)

fun! R(path)
    let cmd = 'grep -rin "* \[ \]" ' . a:path . ' | wc -l'
    echom cmd
    let result = system(cmd)
    call setline(line('.'), getline('.') . ' ' . result)
endfun!
command! -nargs=* Tbd call R(<f-args>)

" ==========================================================================================
"" Vimdiff ignore whitespaces
"set diffopt+=iwhite


" ==========================================================================================
"function! DocGLib()
"    if &ft =~ "c" || &ft =~ "cpp"
"        let s:urlTemplate = "https://developer.gnome.org/search?q=%"
"    else
"        return
"    endif
"    let s:browser = "google-chrome"
"    let s:wordUnderCursor = expand("<cword>")
"    let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
"    let s:cmd = "!" . s:browser . " " . s:url
"    execute s:cmd
"endfunction
"map <silent> <M-g> :call DocGLib()<CR>
"
"au FileType index.txt nnoremap <buffer> <cr>
"    \ :vert belowright split
"    \ |tag <c-r><c-w>
"    \ |vert resize 130<cr>

"" Enable spell check"
command! SpellCheckEN set spell spelllang=en
command! SpellCheckIT set spell spelllang=it

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" Fix remapping error message for Mark-Karkat
nnoremap <leader>n <Plug>Mark

" Toggl
let g:toggl_api_token = "20baf6309de3690b1e311a33bb149f3e"


" Clang_complelte
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'

" ==========================================================================================
" VIM tricks
" ==========================================================================================
"
" Select between parenthesis/quotes...
"
" In visual mode press i and then the parenthesis or the quotes or ...
" e.g. vi(
"" ==========================================================================================
" CCTree
"
"   5.2. Exploring source-code~
"    							*CCTree-explore-source*
"
"   Get reverse call tree for symbol  <C-\><
"   >
"   	:CCTreeTraceReverse <symbolname>
"   <
"
"   Get forward call tree for symbol  <C-\>>
"   >
"   	:CCTreeTraceForward <symbolname>
"   <
"   Increase depth of tree and update <C-\>=
"   >
"   	:CCTreeRecurseDepthPlus
"   <
"   Decrease depth of tree and update <C-\>-
"   >
"   	:CCTreeRecurseDepthMinus
"   <
"" ==========================================================================================
" Some interesting commands
" C-W x                         = switch to windows
" C-w t C-W K                   = from vertical windows to horizontal
" :r scp://user@machine/t1      = open remote file
":toggleWhiteSpaceOnSave        = clean up spaces on save
" 2015-03-30 open tag in vsplit = Ctrl-W Ctrl-]                         #notworking
" 2015-04-08 word count         = g G
" 2015-04-08 highlight words    = /\vWORD1|WORD2|WORD3
" set noinc                     = disable ignore case in search
" :hi link markdownError normal = delete error marks
"" ==========================================================================================
" Diff between buffers:
" 1. split the windows in 2 parts
" 2. Open the files in the two windows
" 3. windo diffthis
" 4. windo diffoff
"   do (diff obtain) and dp (diff put) is what you need. Here is a small list of other helpful commands in this context.
"   ]c               - advance to the next block with differences
"   [c               - reverse search for the previous block with differences
"   do (diff obtain) - bring changes from the other file to the current file
"   dp (diff put)    - send changes from the current file to the other file
"   zo               - unfold/unhide text
"   zc               - refold/rehide text
"   zr               - unfold both files completely
"   Note: Both do and dp work if you are on a block or just one line under a block.
"
"   :diffupdate will re-scan the files for changes
"" ==========================================================================================
" Automatic wrap:
" 1. set textwidth=N (to unset set tw=0)
" 2. set colorcolumn=N
"" ==========================================================================================
" " Check multiple tags for function
" g-]
"
"" ==========================================================================================
" Highlight right margin at 80th character
" set colorcolumn=80
"" ==========================================================================================
"" Python mode
" go to definition <C-c>g
"
"" ==========================================================================================
"" Mispelled words
" set spell spelllang=en_us
" ]s move to next error
" z= suggests alternatives
"" ==========================================================================================
"" LustyExplorer
"   <Leader>lf  - Opens filesystem explorer.
"   <Leader>lr  - Opens filesystem explorer at the directory of the current file.
"   <Leader>lb  - Opens buffer explorer.
"   <Leader>lg  - Opens buffer grep.
"
"" ==========================================================================================
" Cscope mapping
" nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    : find symbol
" nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    : find definition
nmap <C-\>d :cs find g <C-R>=expand("<cword>")<CR><CR>    : find definition
" nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    : find function's callers
" nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    : find text
" nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    : find file
" nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>    : find function's callees

" ==========================================================================================
" Close all windows but the current
" :only == <C-w>o
" Close all the tabs but the current
" :tabonly
"
" ==========================================================================================
" Ctrl-D  move half-page down
" Ctrl-U  move half-page up
" Ctrl-B  page up
" Ctrl-F  page down
" Ctrl-O  jump to last (older) cursor position
" Ctrl-I  jump to next cursor position (after Ctrl-O)
