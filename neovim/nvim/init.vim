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


"" Reload vimrc
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

"" Notes
" ^x^n: autocomplete with words from the current file (^ == ctrl)
" ^x^f: autocomplete filenames
" ^x^]: autocomplete with words from tags
" ^n: autocomplete for anything specified by the 'complete' option
