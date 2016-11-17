
" Notes ---------------------------------------------------------------------------------{{{
    " ^x^n: autocomplete with words from the current file (^ == ctrl)
    " ^x^f: autocomplete filenames
    " ^x^]: autocomplete with words from tags
    " ^n: autocomplete for anything specified by the 'complete' option
" }}}                       /____/

" Vim-plug plugin manager ---------------------------------------------------------------{{{
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  autocmd VimEnter * PlugInstall | source ~/.vimrc
    endif
    call plug#begin()

    " Generic
      Plug 'gnupg.vim'
      Plug 'ludovicchabant/vim-gutentags'             " A Vim Plug that manages your tag files
      Plug 'mileszs/ack.vim'                          " Replacement for vimgrep
      Plug 'vim-scripts/Mark--Karkat', {'on': 'Mark'} " Highlight several words in different colors simultaneously
      Plug 'wincent/command-t'

    " Look and feel
      Plug 'Tagbar'
      Plug 'jeetsukumaran/vim-buffergator'
      Plug 'ntpeters/vim-better-whitespace'
      Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
      Plug 'fatih/molokai'
      Plug 'NLKNguyen/papercolor-theme'
      Plug 'morhetz/gruvbox'
      Plug 'ryanoasis/vim-devicons'
      Plug 'scrooloose/nerdtree'
      Plug 'mhartington/oceanic-next'

    " C/C++
      Plug 'a.vim', {'for': ['c', 'cpp']}
      Plug 'chazy/cscope_maps', {'for': ['c', 'cpp']}
      Plug 'hari-rangarajan/CCTree', {'for': ['c', 'cpp']} " C Call-Tree Explorer -- Cscope based source-code browser; code flow analyzer
      Plug 'vim-scripts/glib.vim', {'for': ['c', 'cpp']}
      Plug 'vim-utils/vim-man', {'for': ['c', 'cpp']}
      Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}

    " Completion and Linting
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'zchee/deoplete-clang'
      Plug 'neomake/neomake'

    " Foo
      Plug 'szw/vim-g'                                " Quick Google lookup

    " GIT helpers
      Plug 'vimwiki/vimwiki'
      Plug 'tpope/vim-fugitive'
      Plug 'airblade/vim-gitgutter'
      Plug 'Xuyuanp/nerdtree-git-plugin'

    " Go
      Plug 'fatih/vim-go', {'for': 'go'}

    " GTD
      Plug 'junegunn/goyo.vim', {'on': 'Goyo'}        " Distraction free editing toggle :Goyo, end :Goyo!
      Plug 'vim-jp/vital.vim'
      Plug 'termoshtt/toggl.vim'
      Plug 'wakatime/vim-wakatime'                    " Track working time

    " HTML
      Plug 'alvan/vim-closetag', {'for': 'html'}

    " Python
      Plug 'davidhalter/jedi', {'for': 'python'}
      Plug 'davidhalter/jedi-vim', {'for': 'python'}

    call plug#end()


    let vim_fold=1
    set nocompatible
" Let allow buffers to be hidden when not already saved (do I really need this?)
    set hidden
" }}}

" Editor --------------------------------------------------------------------------------{{{
    set guifont=Monospace\ 11
    colorscheme gruvbox
    set background=dark
    syntax enable
    filetype on
    let g:gruvbox_contrast_dark="hard"
    set linespace=1
" Writer mode
    nmap <F1> <Esc>:Goyo<CR>
" Enable spell check"
    command! SpellCheckEN set spell spelllang=en
    command! SpellCheckIT set spell spelllang=it
" Thesaurus
    set thesaurus+=~/.vim/thesaurus/thesaurus.txt
" }}}

" System settings -----------------------------------------------------------------------{{{

" Neovim settings
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    set clipboard+=unnamedplus
" show last command in the very bottom right of VI
    set showcmd
" graphical menu of autocomplete matches
    set wildmenu
    set wildmode=list:longest
" UI config
    " Remove toolbar, make space!
    set guioptions-=T
    " Keep the cursor from reaching the last line make it easy to scroll down/up.
    set scrolloff=7
    set relativenumber
    hi clear CursorLine
    set cursorline
    hi CursorLineNR cterm=bold
    " Let airline show my status
    set noshowmode
    " Folding
    set foldenable
    nnoremap <space> za
    vnoremap <space> za
" Autosave setup
    set nobackup
    set noswapfile
    set autowrite
" Autocomplete setup
    set completeopt=longest,menu,preview
" Block select not limited to shortest line
    set virtualedit=
    set laststatus=2
    set lazyredraw      " the screen will be redraw less often
" Tabs
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
" Highlight spaces, tabs, end of line chars, wrap and brake lines
    set list lcs=trail:·,tab:»· ",eol:¶
    set wrap linebreak nolist
    set showbreak=└
    set showmatch       " show matching parenthesis
    let loaded_matchparen = 0
    hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
" Better whitespace color
    highlight ExtraWhitespace ctermbg=Yellow
" Enable remove extra whitespaces
    nnoremap ss :ToggleStripWhitespaceOnSave<CR>
" Insert the current date (insert mode, normal/command mode)
    inoremap <A-d> <C-R>=strftime("%Y-%m-%d")<CR>
    map <A-d> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
"}}}

" System mappings------------------------------------------------------------------------{{{

" <Esc> is too far away: using two remaps so that one hand is busy (e.g.
" mouse, cookie, etc.) I can still use the other one.
    inoremap jj <Esc>
    inoremap qq <Esc>
" No Ex mode
    nnoremap Q <nop>
" Macro is most of the time on my way and most of the time I don't need it
    map q <nop>
" Exit insert, delete line, back to insert
    inoremap <C-d> <esc>ddi
" Navigate through lines in wrapping mode
    noremap <silent> <Up> gk
    noremap <silent> <Down> gj
    noremap <silent> k gk
    noremap <silent> j gj
    " Remap fast moves
    nnoremap L g_
    nnoremap H ^
    nnoremap K 10k
    nnoremap J 10j
" Let path autocomplete faster
    inoremap <c-f> <c-x><c-f>
" Copy-to/Paste-from system clipboard (using Meta-v for paste, because Ctrl-v is for visual mode)
    vnoremap <c-c> "+y<CR>
    inoremap <m-v> <esc>"+p
    noremap  <m-v> "+p
" Manage multi-cursor
    let g:multi_cursor_next_key='<c-n>'
    let g:multi_cursor_prev_key='<c-p>'
    let g:multi_cursor_skip_key='<c-x>'
    let g:multi_cursor_quit_key='<esc>'
" Align blocks of text and  keep them selected
    vmap < <gv
    vmap > >gv
" Search&Replace
    " VIM 'fuzzy finder' built-in
    " Use 'find' with resposability! It'll look into subfolders (e.g. not a great idea run it in the Home)
    set path+=**
    " Tweaks for VIM file browsing
    let g:netrw_browse_split=4  " open in prior window
    "let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_liststyle=3     " tree view
    let g:netrw_winsize = 20
    nnoremap tt <Esc>:Lexplore<CR>
    set ignorecase
    " search as characters are entered
    set incsearch
    " highlight matches
    set hlsearch
    " Fix backspace misbehavior
    set backspace=indent,eol,start
    set grepprg=ack
    let g:ackprg = 'ag'
    let g:ack_default_options = " -s -H --nogroup --column --smart-case --follow"
    let g:ackhighlight = 1
    " Highlight current word
    nnoremap * *<C-o>
    " Stop highlighting the old search
    nnoremap <leader><space> :nohlsearch<CR>
    " Go to next match
    nnoremap n nzzzv
    " Go to previous match
    nnoremap N Nzzzv
    " Look for text in current buffer
    nnoremap fh <Esc>/
    " Look for selected text in current buffer
    vnoremap fh y/<C-r>"<CR>
    " Look for text pattern in all the files recursively
    nnoremap fa <Esc>:Ack!<space>
    " Look for file that match a pattern
    nnoremap ff <Esc>:find<space>
    " Search pattern and replace (sed like syntax)
    " TODO: change shortcut?
    noremap rep <Esc>:%s//gc<Left><Left><Left>
    " Edit init.vim
    command! Einit edit ~/.vimrc
    " Reload vimrc
    command! Reinit so ~/.vimrc
    nnoremap R <esc>:Reinit<cr>
    " The Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor
    endif

    " bind F to grep word under cursor
    nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    " Simplify manual indenting
    nnoremap > >>
    nnoremap < <<
"}}}

" Buffers -------------------------------------------------------------------------------{{{

" Save current buffer.
    inoremap <C-s> <Esc>:w<CR>
    noremap <C-s> <Esc>:w<CR>

" Close and Force Close buffer
    noremap q <Esc>:bd<CR>
    nnoremap fq <Esc>:bd!<CR>

" Move among tabs in Konsole-style and to go to next buffer (this collides with tmux!?!)
    noremap <A-Right> gt
    noremap <A-k> <Esc>gt<CR>
    noremap <A-Left> gT
    noremap <A-j> <Esc>gT<CR>

" Move among buffers
    noremap <C-Left> <Esc>:bp<CR>
    noremap <C-h> <Esc>:bp<CR>
    noremap <C-Right> <Esc>:bnext<CR>
    noremap <C-l> <Esc>:bnext<CR>

" New Tab (temporally replaced to make space to command-t)
"    nnoremap <C-S-t> :tabnew<CR>
"    inoremap <C-S-t> <Esc>:tabnew<CR>

" Style open split on the right
    set splitright
    set splitbelow

function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
endfunction

" }}}

" Airline -------------------------------------------------------------------------------{{{

    let g:airline_theme='bubblegum'
    let g:airline_powerline_fonts=1

    " To be used only with Monaco font
    if !exists('g:airline_symbols')
    let g:airline_symbols = {}
      endif
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    "let g:airline#extensions#tabline#left_alt_sep = ''
    "let g:airline#extensions#tabline#left_sep = ''
    "let g:airline#extensions#tabline#right_sep = ''
    let g:airline_section_c = '%<%.40F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" }}}

" NERDTree ------------------------------------------------------------------------------{{{

nmap <F2> :NERDTreeToggle<CR>
" Change current working directory based on root directory in NERDTree
    let NERDTreeChDirMode=1
" Start NERDTree in minimal UI mode (No help lines)
    let NERDTreeMinimalUI=0
    let NERDTreeCaseSensitiveSort=1
    let NERDTreeWinSize=70
    let NERDTreeDirArrows=1
    let NERDTreeAutoDeleteBuffer=1
    let NERDTreeShowBookmarks=1
    let NERDChristmasTree=1
    let NERDTreeHighlightCursorline=1
    let NERDTreeWinSize=30
    let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.lo$']
" Close NERDTree when it's the last buffer open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" Vimwiki -------------------------------------------------------------------------------{{{
    let wiki =     {'path': '~/Dropbox/Wiki/', 'auto_toc': 1, 'ext': '.md', 'syntax': 'markdown'}
    let telit =    {'path': '~/Dropbox/Work/Telit/TelitWiki/', 'auto_toc': 1, 'ext': '.md', 'syntax': 'markdown'}

    let g:vimwiki_list = [telit, wiki]
    let g:vimwiki_folding='expr'
" }}}

" TagBar --------------------------------------------------------------------------------{{{

nnoremap tb <Esc>:TagbarToggle<CR>
let g:tagbar_ctags_bin = "ctags"
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim/config/vwtags.py'
          \ , 'ctagsargs': 'all'
          \ }

" }}}

" Snippets" -----------------------------------------------------------------------------{{{

" Bash
    nnoremap <leader>bopt :-1read ~/.vim/snippets/bash/getopts.sh<CR>wwa

" }}}

" TBD" ----------------------------------------------------------------------------------{{{
source ~/.vim/config/setup-dev-mode.vim


autocmd Syntax vimwiki setlocal foldlevel=20

" Fix remapping error message for Mark-Karkat
nnoremap <leader>n <Plug>Mark
set nocscopeverbose

" Toggl
let g:toggl_api_token = "20baf6309de3690b1e311a33bb149f3e"

" Clang_complete
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Keep this at the end or it will be overwritten by some plugin
    set foldmethod=marker
    set foldlevel=0
    set modelines=1

"}}}

" CommandT ------------------------------------------------------------------------------{{{
    nnoremap <M-t> <esc>:CommandT<CR>
" }}}