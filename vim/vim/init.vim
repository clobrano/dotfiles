"   _________  ____  / __(_)___ ___  ___________ _/ /_(_)___  ____
"  / ___/ __ \/ __ \/ /_/ / __ `/ / / / ___/ __ `/ __/ / __ \/ __ \
" / /__/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / /_/ / /_/ / / / /
" \___/\____/_/ /_/_/ /_/\__, /\__,_/_/   \__,_/\__/_/\____/_/ /_/
"

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
      Plug 'vim-scripts/gnupg.vim'
      Plug 'ludovicchabant/vim-gutentags'             " A Vim Plug that manages your tag files
      Plug 'mileszs/ack.vim'                          " Replacement for vimgrep
      Plug 'vim-scripts/Mark--Karkat', {'on': 'Mark'} " Highlight several words in different colors simultaneously
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Look and feel
      Plug 'vim-scripts/Tagbar'
      Plug 'jeetsukumaran/vim-buffergator'
      Plug 'ntpeters/vim-better-whitespace'
      Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
      Plug 'fatih/molokai'
      Plug 'NLKNguyen/papercolor-theme'
      Plug 'morhetz/gruvbox'
      Plug 'ryanoasis/vim-devicons'
      Plug 'scrooloose/nerdtree'
      Plug 'mhartington/oceanic-next'
      Plug 'crusoexia/vim-monokai'
      Plug 'noahfrederick/vim-hemisu'

    " Android
      Plug 'hsanson/vim-android'

    " C/C++
      Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
      Plug 'chazy/cscope_maps', {'for': ['c', 'cpp']}
      Plug 'hari-rangarajan/CCTree', {'for': ['c', 'cpp']} " C Call-Tree Explorer -- Cscope based source-code browser; code flow analyzer
      Plug 'vim-scripts/glib.vim', {'for': ['c', 'cpp']}
      Plug 'vim-utils/vim-man', {'for': ['c', 'cpp']}
      Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
      "Plug 'xolox/vim-easytags' | Plug 'xolox/vim-misc'

    " Completion and Linting
      "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'zchee/deoplete-clang'
      "Plug 'neomake/neomake'

    " Programming
      Plug 'idanarye/vim-vebugger'

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

    " Presentation
      Plug 'sotte/presenting.vim'
      Plug 'alfredodeza/posero.vim'
    call plug#end()

    set nocompatible
" Let allow buffers to be hidden when not already saved (do I really need this?)
    set hidden
" }}}

" Editor --------------------------------------------------------------------------------{{{
    set guifont=Monaco\ for\ Powerline\ 11
    set background=light
    colorscheme hemisu
    syntax enable
    filetype on
    let g:gruvbox_contrast_dark="hard"
    set linespace=1
    nnoremap sf <esc>:set guifont=Monaco\ for\ Powerline\<space>
    command! Hemisu set background=light | colorscheme hemisu | AirlineTheme oceanicnextlight
    command! Papercolor set background=light | colorscheme PaperColor | AirlineTheme papercolor
    command! Monokai set background=dark | colorscheme monokai | AirlineTheme bubblegum
    command! Gruvbox set background=dark | colorscheme gruvbox | AirlineTheme bubblegum
" Writer mode
    nmap <F1> <Esc>:Goyo<CR>
" Enable spell check"
    command! SpellCheckEN set spell spelllang=en
    command! SpellCheckIT set spell spelllang=it
" Thesaurus
    set thesaurus+=~/.vim/thesaurus/thesaurus.txt
" }}}

" System settings -----------------------------------------------------------------------{{{

    set mouse=a
" Neovim settings
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    set clipboard+=unnamedplus
" show last command in the very bottom right of VI
    set showcmd
" graphical menu of autocomplete matches
    set wildmenu
    set wildmode=list:longest,full
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
    nnoremap m q
" Exit, delete line, back to insert (and I should remember to use it)
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
" Copy-to/Paste-from system clipboard (using Meta-v for paste, because Ctrl-v is for visual mode)
    vnoremap <m-c> "+y<CR>
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
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ackprg = 'ag'
    endif
    let g:ack_default_options = " -s -H --nogroup --column --smart-case --follow"
    let g:ackhighlight = 1
    " Highlight current word
    nnoremap * *<C-o>
    " Stop highlighting the old search
    nnoremap <leader><space> :nohlsearch<CR>
    " Go to next match
    nnoremap n nzz
    " Go to previous match
    nnoremap N Nzz
    " This zz above is great! It means auto-center, let's do it for more things
    nnoremap } }zz
    nnoremap gg ggzz
    nnoremap G Gzz

   " bind F to grep word under cursor (use with caution!)
    nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    " Look for text in current buffer
    nnoremap fh <Esc>:g//#<left><left>
    " Look for selected text in current buffer
    vnoremap fh y:g/<C-r>"/#<CR>
    " Find Next/Prev
    nnoremap fn <esc>/
    vnoremap fn y/<C-r>"<cr>
    nnoremap fp <esc>?
    vnoremap fp y?<C-r>"<cr>
    " Fzf fuzzy searcher (fs = file search)
    nnoremap fs <esc>:FZF<cr>
    " Look for text pattern in all the files recursively
    nnoremap fa <Esc>:Ack!<space>
    " Look for file that match a pattern
    nnoremap ff <Esc>:find *
    " Search pattern and replace (sed like syntax)
    " TODO: change shortcut?
    noremap rep <Esc>:%s//gc<Left><Left><Left>

    " Edit init.vim
    command! Einit edit ~/.vimrc
    " Reload vimrc
    command! Reinit so ~/.vimrc
    nnoremap R <esc>:Reinit<cr>


    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    " Simplify manual indenting
    nnoremap > >>
    nnoremap < <<
    " Quickfix <next>/<prev> entry mapping
    nnoremap cn :cn<CR>
    nnoremap cp :cp<CR>

    " Write protected file with superuser privilegies
    command! SudoWrite  w !sudo tee %

    " Invoke make
    "nnoremap <leader>m :make<CR>
    nnoremap <leader>m :silent make\|redraw!\|cw<CR>

    " Vertical splits to Horizontal and vice versa
    nnoremap h2v <C-w>t<C-w>H
    nnoremap v2h <C-w>t<C-w>K
"}}}

" Buffers -------------------------------------------------------------------------------{{{

" Save current buffer.
    inoremap <C-s> <Esc>:w<CR>
    noremap <C-s> <Esc>:w<CR>

" Close and Force Close buffer
    noremap x <Esc>:bd<CR>
    nnoremap fx <Esc>:bd!<CR>

" Move among tabs in Konsole-style and to go to next buffer (this collides with tmux!?!)
    noremap <A-l> gt
    noremap <A-k> <Esc>gt<CR>
    noremap <A-h> gT
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

" Folding " -----------------------------------------------------------------------------{{{
    " Folding
    set foldenable
    " Generic foldmethod
    set foldmethod=syntax
    set foldlevel=99
    nnoremap za zA
    nnoremap zM zm
    nnoremap <space> zA
    vnoremap <space> zA
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

" }}}

" Airline -------------------------------------------------------------------------------{{{

    let g:airline_theme='oceanicnextlight'
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
    let projects =    {'path': '~/', 'auto_toc': 1, 'ext': '.md', 'syntax': 'markdown'}

    let g:vimwiki_list = [telit, projects, wiki]
    let g:vimwiki_folding='list'
    nnoremap dn :VimwikiDiaryNextDay<cr>
    nnoremap dp :VimwikiDiaryPrevDay<cr>
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
" Generic
    iabbr {{ {}<esc>
    iabbr (( ()<esc>

" Bash
    " Getopts
    autocmd Filetype sh nnoremap <leader>bopt :-1read ~/.config/nvim/snippets/bash/getopts.sh<CR>$a
    iabbr bopt <esc>:-1read ~/.config/nvim/snippets/bash/getopts.sh<CR>$a
    iabbr bfor  for i in; do<cr>done<esc>1<up>f;i
    command! Docopts r !docopt.sh -s %

    " Auto shebang
    augroup Shebang
      autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: UTF-8 -*-\<nl>\"|$
      autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl># vi: set ft=python :\<nl>\"|$
      autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
      autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
      autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
    augroup END

    " Redirect to syslog
    iabbr redsys exec 1> >(logger -s -t $(basename $0)) 2>&1

"C-C++
    iabbr cfor  for(i =; i; i++) {<cr>}<esc>1<up>f=a
    iabbr cifelse if (){<cr>} else {<cr>}<esc>2<up>f(
" }}}

" FileTypes customizations" -------------------------------------------------------------{{{
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal foldnestmax=2
    autocmd FileType python setlocal makeprg=pytest

    autocmd Syntax vim setlocal foldmethod=marker
    autocmd Syntax vim setlocal foldlevel=0
    autocmd Syntax vim setlocal modelines=1

    autocmd FileType vimwiki setlocal textwidth=100
"}}}

" Generic sofware development" ----------------------------------------------------------{{{
    set number            " Show line numbers
    set colorcolumn=0     " Show a colored line at the Nth column
    set nocursorline      " Disable highlight current line

    " Auto add closing bracket
    "inoremap {<CR>  {<CR>}<Esc>O<Tab>
    "inoremap {<Tab>  {}<Left>

    " Align function arguments
    set cino+=(0

    " make
    nnoremap <leader>i <esc>:!sudo make install<cr>

    " Command to set the current working directory
    command! Sethere lcd %:p:h
    nnoremap sth <Esc>:Sethere<CR>

    " Mark--Karkat (TODO dunno what it does)
    vnoremap {Leader}/  n

    " Mark--Karkat, fix remapping error message
    nnoremap <leader>n <Plug>Mark
    set nocscopeverbose

    " Toggl
    let g:toggl_api_token = "20baf6309de3690b1e311a33bb149f3e"

    " Clang_complete
    let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow

    " Letsdo mapping
    nnoremap <leader>ld <esc>:!letsdo<space>
"}}}

" Cscope" -------------------------------------------------------------------------------{{{
    set cscopetag nocscopeverbose
    "" Update cscope db
    command! Csmake !find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ; cscope -b -i cscope.files -f cscope.out
    nnoremap csmake :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;
      \:!cscope -b -i cscope.files -f cscope.out<CR>
      \:cs kill -1<CR>:cs add cscope.out<CR>
    nnoremap csl <Esc>:cs add cscope.out<CR>
    nnoremap csc <Esc>:cs find c<space>
    nnoremap cscw yw<Esc>:cs find c<space><c-r>"
    nnoremap csg <Esc>:cs find g<space>
    nnoremap csgw yw<Esc>:cs find g<space><c-r>"
    nnoremap csf <Esc>:cs find f<space>
    nnoremap csfw yw<Esc>:cs find f<space><c-r>"
    nnoremap css <Esc>:cs find s<space>
    nnoremap cssw yw<Esc>:cs find s<space><c-r>"

    command! -nargs=1 Csdef  :cs find g <f-args>
    command! -nargs=1 Cscall :cs find c <f-args>
    command! -nargs=1 Cssym  :cs find s <f-args>
    command! -nargs=1 Csincl :cs find i <f-args>


    "" Quickfix window for cscope in place of interactive window
    if has('quickfix')
        set cscopequickfix=c-,d-,e-,f-,g-,i-,t-,s-
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
"}}}

" Ctags " -------------------------------------------------------------------------------{{{
    " Command to create new ctags file
    command! CtagsMake !ctags -R --extra=+f --fields=+lSK-k -e --c-kinds=+defmtx .

    "Makes ctags visible from subdirectories
    set tags=tags;/

    noremap T <Esc>:tag<space>

    " Move to next tag
    noremap <C-[> <C-o>

    " Open Tag in vertical split
    map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

    " vim-easytag integration
    let g:easytags_async=1
    let g:easytags_on_cursorhold = 0
    set tags=./tags;
    let g:easytags_dynamic_files = 1
" }}}

" Golang " ------------------------------------------------------------------------------{{{
" Vim-go
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
" }}}

" Git " ---------------------------------------------------------------------------------{{{
    nnoremap gt <Esc>:GitGutterLineHighlightsToggle<CR>

    nnoremap <leader>gs <esc>:Gstatus<cr>
    nnoremap <leader>gw <esc>:Gwrite<cr>
    nnoremap <leader>gr <esc>:Gread<cr>
    nnoremap <leader>gc <esc>:Gcommit<cr>
    nnoremap <leader>gph <esc>:Gpush<cr>
    nnoremap <leader>gpl <esc>:Gpull<cr>

" }}}

" Jedi-vim " ----------------------------------------------------------------------------{{{
    let g:jedi#documentation_command = "<M>"
" }}}

" Poser----------------------------------------------------------------------------------{{{
    let g:posero_default_mappings = 1
" }}}

" Neomake " -----------------------------------------------------------------------------{{{

" }}}

" " ----------------------------------------------------------------------------------{{{
" }}}
