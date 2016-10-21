" Vim-plug manager
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
    endif
    call plug#begin()
    source ~/.config/nvim/config/vim-plugins.vim
    call plug#end()

    set nocompatible
" After all the bundle, we can set back filetype on
    filetype on
" Let allow buffers to be hidden when not already saved (do I really need this?)
    set hidden
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" VIM can fuzzy find without plugins
" Use 'find' with resposability! It'll look into subfolders (not a great idea
" run it in the Home)
    set path+=**

" Tweaks for VIM file browsing
    let g:netrw_browse_split=4                      " open in prior window
    let g:netrw_altv=1                              " open splits to the right
    let g:netrw_liststyle=3                         " tree view
    let g:netrw_winsize = 20
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
    nnoremap tt <Esc>:Vexplore<CR>


" Edit init.vim
    command! Einit edit ~/.config/nvim/init.vim
" Reload vimrc
    command! Reinit so ~/.config/nvim/init.vim
" <Esc> is too far and never type double q, so it is perfect (so far).
    inoremap qq <Esc>
" Don't really use macro recording so far, so disabling it.
    nnoremap q <Nop>

" Specific configuration files, so that this one does not become too messy.
    source ~/.config/nvim/config/buffers.vim
    source ~/.config/nvim/config/look-and-feel.vim
    source ~/.config/nvim/config/setup-airline.vim
    source ~/.config/nvim/config/setup-dev-mode.vim
    source ~/.config/nvim/config/setup-markdown.vim
    source ~/.config/nvim/config/setup-nerdtree.vim
    source ~/.config/nvim/config/text-changers.vim
    source ~/.config/nvim/config/vimwiki.vim
    source ~/.config/nvim/config/setup-tagbar.vim

" Writer mode
nmap <F1> <Esc>:Goyo<CR>

"" Enable spell check"
command! SpellCheckEN set spell spelllang=en
command! SpellCheckIT set spell spelllang=it

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" Fix remapping error message for Mark-Karkat
nnoremap <leader>n <Plug>Mark

" Toggl
let g:toggl_api_token = "20baf6309de3690b1e311a33bb149f3e"


" Clang_complelte
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"" Notes
" ^x^n: autocomplete with words from the current file (^ == ctrl)
" ^x^f: autocomplete filenames
" ^x^]: autocomplete with words from tags
" ^n: autocomplete for anything specified by the 'complete' option
