"   _________  ____  / __(_)___ ___  ___________ _/ /_(_)___  ____
"  / ___/ __ \/ __ \/ /_/ / __ `/ / / / ___/ __ `/ __/ / __ \/ __ \
" / /__/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / /_/ / /_/ / / / /
" \___/\____/_/ /_/_/ /_/\__, /\__,_/_/   \__,_/\__/_/\____/_/ /_/
"

"" Template -----------------------------------------------------------------------------{{{
" }}}

" Notes ---------------------------------------------------------------------------------{{{
    " ^x^n: autocomplete with words from the current file (^ == ctrl)
    " ^x^f: autocomplete filenames
    " ^x^]: autocomplete with words from tags
    " ^n: autocomplete for anything specified by the 'complete' option
    " <C-r>=    : in insert mode evaluate any expression
    " g <C-g>   : text statistics
    " gg=G      : uniform indentation in the whole file
    " :global/require/normal @b     Apply register b to all file
    " cgn: change multicursor native: change first, then n (next) . (dot) to repeat
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
      Plug 'frioux/vim-lost'
      Plug 'MattesGroeger/vim-bookmarks'
      Plug 'Yggdroot/indentLine'
      Plug 'chrisbra/Colorizer'
      Plug 'tpope/vim-surround'
      Plug 'ctrlpvim/ctrlp.vim', {'for': 'go'}
      Plug 'terryma/vim-multiple-cursors'
      Plug 'derekwyatt/vim-fswitch'

    " Beautify copy/paste on external media
      Plug 'google/vim-syncopate' | Plug 'google/vim-maktaba'

    " Look and feel
      Plug 'vim-scripts/Tagbar'
      Plug 'jeetsukumaran/vim-buffergator'
      Plug 'ntpeters/vim-better-whitespace'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      Plug 'fatih/molokai'
      Plug 'NLKNguyen/papercolor-theme'
      Plug 'morhetz/gruvbox'
      Plug 'ryanoasis/vim-devicons'
      Plug 'scrooloose/nerdtree'
      Plug 'mhartington/oceanic-next'
      Plug 'crusoexia/vim-monokai'
      Plug 'noahfrederick/vim-hemisu'
      Plug 'dikiaap/minimalist'
      Plug 'w0rp/ale'

    " C/C++
      "Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
      Plug 'chazy/cscope_maps', {'for': ['c', 'cpp']}
      Plug 'hari-rangarajan/CCTree', {'for': ['c', 'cpp']} " C Call-Tree Explorer -- Cscope based source-code browser; code flow analyzer
      Plug 'vim-scripts/glib.vim', {'for': ['c', 'cpp']}
      Plug 'vim-utils/vim-man', {'for': ['c', 'cpp']}
      Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
      Plug 'vim-scripts/valgrind.vim', {'for': ['c', 'cpp']}

    " Foo
      Plug 'szw/vim-g'                                " Quick Google lookup
      Plug 'vim-scripts/DrawIt'

    " GIT helpers
      Plug 'lambdalisue/gina.vim'
      "Plug 'tpope/vim-fugitive'
      Plug 'airblade/vim-gitgutter'
      Plug 'Xuyuanp/nerdtree-git-plugin'
      "Plug 'codeindulgence/vim-tig'

    " Go
      Plug 'fatih/vim-go', {'for': 'go'}

    " GTD
      Plug 'vimwiki/vimwiki'
      Plug 'junegunn/goyo.vim', {'on': 'Goyo'}        " Distraction free editing toggle :Goyo, end :Goyo!
      Plug 'vim-jp/vital.vim'

    " HTML
      Plug 'alvan/vim-closetag', {'for': 'html'}

    " NodeJS
      Plug 'moll/vim-node', {'for': 'javascript'}
      Plug 'guileen/vim-node-dict'

    " Javascript
      Plug 'pangloss/vim-javascript', {'for': 'javascript'}
      Plug 'digitaltoad/vim-pug', {'for': 'pug'}

    " Python
      Plug 'davidhalter/jedi', {'for': 'python'}
      Plug 'davidhalter/jedi-vim', {'for': 'python'}

    " Presentation
      Plug 'sotte/presenting.vim'
      Plug 'alfredodeza/posero.vim'

    " QML
      Plug 'peterhoeg/vim-qml'

    call plug#end()

    set nocompatible
" Let allow buffers to be hidden when not already saved (do I really need this?)
    set hidden
" }}}

" Editor --------------------------------------------------------------------------------{{{
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
    "set background=light
    "colorscheme PaperColor
    syntax enable
    filetype on
    let g:gruvbox_contrast_dark="hard"
    set linespace=1
    nnoremap sf <esc>:set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\<space>
    command! Gruvbox    colorscheme gruvbox    | set background=dark  | AirlineTheme bubblegum
    command! Hemisu     colorscheme hemisu     | set background=dark  | AirlineTheme oceanicnextlight
    command! Molokai    colorscheme molokai    | set background=dark  | AirlineTheme oceanicnextlight
    command! Monokai    colorscheme monokai    | set background=dark  | AirlineTheme bubblegum
    command! Papercolor colorscheme PaperColor | set background=light | AirlineTheme oceanicnextlight
    colorscheme PaperColor
    set background=light
" Writer mode
    nmap <F1> <Esc>:Goyo<CR>
" Enable spell check"
    command! SpellEn set spell spelllang=en
    command! SpellIt set spell spelllang=it
" Thesaurus
    set thesaurus+=~/.vim/thesaurus/thesaurus.txt
" }}}

" System settings -----------------------------------------------------------------------{{{
    set mouse=a
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
    "set relativenumber
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
    set lcs=trail:·,tab:»· ",eol:¶
    set wrap linebreak nolist
    set showbreak=└
    set showmatch       " show matching parenthesis
    let loaded_matchparen = 0
    hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
" Better whitespace color
    highlight ExtraWhitespace ctermbg=Yellow
" Enable remove extra whitespaces
    nnoremap ss :ToggleStripWhitespaceOnSave<CR>
" Insert the current date long and short (insert mode, normal/command mode)
    inoremap <A-D> <C-R>=strftime("%Y-%m-%d")<CR>
    map <A-D> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
    inoremap <A-d> <C-R>=strftime("%y/%j")<CR>
    map <A-d> a<C-R>=strftime("%y/%j")<CR><Esc>
"}}}

" System mappings------------------------------------------------------------------------{{{
    let mapleader=" "
" <Esc> is too far away: using two remaps so that one hand is busy (e.g.
" mouse, cookie, etc.) I can still use the other one.
    inoremap jj <Esc>
    inoremap fj <Esc>
    inoremap qq <Esc>
" No Ex mode
    nnoremap Q <nop>
" Macro is most of the time on my way and most of the time I don't need it
    "map q <nop>
    "nnoremap m q
" Exit, delete line, back to insert (and I should remember to use it)
    inoremap <C-d> <esc>ddi
" Navigate through lines in wrapping mode
    noremap <silent> <Up> gk
    noremap <silent> <Down> gj
    noremap <silent> k gk
    noremap <silent> j gj
    " Remap fast moves
    nnoremap <C-l> g_
    nnoremap <C-h> ^
    nnoremap <C-k> 10k
    nnoremap <C-j> 10j
    vnoremap E g_
    vnoremap B ^
" Copy-to/Paste-from system clipboard (using Meta-v for paste, because Ctrl-v is for visual mode)
    " Do not overwrite selected text on copy
    xnoremap <silent> p p:let @+=@0<CR>
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
    nnoremap <leader>tt <Esc>:Lexplore<CR>

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
    nnoremap <leader>F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    " Look for text in current buffer
    nnoremap fh <Esc>:g//#<left><left>
    " Look for selected text in current buffer
    vnoremap fh y:g/<C-r>"/#<CR>
    " Find Next/Prev
    nnoremap fn <esc>/
    vnoremap fn y/<C-r>"<cr>
    nnoremap fp <esc>?
    vnoremap fp y?<C-r>"<cr>
    " Fzf fuzzy searcher (ff = find file)
    nnoremap ff <esc>:FZF<cr>
    " Look for text pattern in all the files recursively
    nnoremap fa <Esc>:Ack! --ignore-dir=TAGS --ignore-dir=tags --ignore-dir=cscope.* ""<left>
    nnoremap fc <Esc>:Ack! --ignore-dir=TAGS --ignore-dir=tags --ignore-dir=cscope.* ""<left><C-r><C-w>
    " Look for file that match a pattern
    "nnoremap ff <Esc>:find *
    " Search pattern and replace (sed like syntax)
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
    " Location-list <next>/<prev> entry mapping
    "nnoremap <leader>ln :lne<CR>
    "nnoremap <leader>lp :lp<CR>
    " Write protected file with superuser privilegies
    command! SudoWrite  w !sudo tee %

    " Invoke make
    "nnoremap <leader>c :make<CR>
    nnoremap <leader>c :silent make\|redraw!\|cw<CR>
"}}}

" Buffers -------------------------------------------------------------------------------{{{

" Save current buffer.
    inoremap <C-s> <Esc>:w<CR>
    noremap <C-s> <Esc>:w<CR>

" Close and Force Close buffer
    noremap x <Esc>:bd<CR>
    nnoremap fx <Esc>:bd!<CR>

" Move among buffers
    noremap <A-Left> <Esc>:bp<CR>
    noremap H <Esc>:bp<CR>
    noremap <A-Right> <Esc>:bnext<CR>
    noremap L <Esc>:bnext<CR>

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
    "nnoremap <space> zA
    "vnoremap <space> zA
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

    let g:airline_powerline_fonts=1
    let g:airline_theme='oceanicnextlight'

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
    let g:airline#extensions#tabline#buffer_nr_show = 1
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
    let tracker =    {'path': '~/Dropbox/Work/Telit/Tracker/', 'auto_toc': 1, 'ext': '.md', 'syntax': 'markdown'}
    let notes =    {'path': '~/Dropbox/Notes/', 'auto_toc': 1, 'ext': '.md', 'syntax': 'markdown'}

    let g:vimwiki_list = [notes, telit, tracker, wiki]
    let g:vimwiki_folding='list'

    nnoremap dn :VimwikiDiaryNextDay<cr>
    nnoremap dp :VimwikiDiaryPrevDay<cr>

    " Task Done (move current line at the bottom of the file)
    nnoremap td dd/^#.*Done<esc>p^a <C-R>=strftime("%y/%j")<CR><esc>
    " Task Up (move current line on top of the list
    nnoremap tu dd?^#<cr>p<leader><space>
    " Todo in Later
    nnoremap tl dd/^#.*Later<esc>p^a <C-R>=strftime("%y/%j")<CR><esc>
    " Todo in Next
    nnoremap tn dd?^#.*Todo<esc>p^a<esc>
    " Todo in someday
    nnoremap ts dd?^#.*Someday<esc>p^a<esc>
    " Todo prio change
    nnoremap tpa v$:s/([A-C])/(A)/g<CR>
    nnoremap tpb v$:s/([A-C])/(B)/g<CR>
    nnoremap tpc v$:s/([A-C])/(C)/g<CR>
" }}}

" TagBar --------------------------------------------------------------------------------{{{

nnoremap tb <Esc>:TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_zoomwidth = 0
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

" Cscope" -------------------------------------------------------------------------------{{{
    set cscopetag nocscopeverbose
    "" Update cscope db
    command! Csfiles !find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files

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
    command! CtagsMake !ctags -R --exclude=.git .

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
    au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
    au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>gi <Plug>(go-imports)
    au FileType go nmap <Leader>gs <Plug>(go-def-split)
    au FileType go nmap <Leader>gw <Plug>(go-doc-browser)
    au FileType go nmap <leader>gb <Plug>(go-build)
    au FileType go nmap <leader>gc <Plug>(go-coverage)
    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gt <Plug>(go-test)
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
" }}}

" Git " ---------------------------------------------------------------------------------{{{
    nnoremap <leader>gs <esc>:Gstatus<cr>
    nnoremap <leader>gw <esc>:Gwrite<cr>
    nnoremap <leader>gr <esc>:Gread<cr>
    nnoremap <leader>gc <esc>:Gcommit<cr>
    nnoremap <leader>gph <esc>:Gpush<cr>
    nnoremap <leader>gpl <esc>:Gpull<cr>
    " Push in review for given branch
    nnoremap <leader>gpr <esc>:Git push origin HEAD:refs/for/

" }}}

" Jedi-vim " ----------------------------------------------------------------------------{{{
    "let g:jedi#documentation_command = "<leader>pm"
    let g:jedi#force_py_version=3
" }}}

" ALE " ---------------------------------------------------------------------------------{{{
    nmap <F8> <Plug>(ale_fix)
    let g:ale_fixers = {
        \ 'c': [
        \   'cppcheck',
        \ ],
        \ 'python': [
        \   'flake8',
        \ ],
    \}

    let g:ale_linters = {
        \ 'c': ['cppcheck', 'clang', 'gcc'],
        \ 'cpp': ['cppcheck', 'clang', 'gcc'],
    \}

    let g:ale_cppcheck_options = '--enable=warning --enable=style --enable=performace'
    let g:ale_python_flake8_options = '--ignore=E115,E266,E501,C0301'
    " }}}

"" FZF ----------------------------------------------------------------------------------{{{
let g:fzf_launcher = 'xterm -T fzf -fa monaco -fs 10 -e bash -ic %s'
" }}}

" Poser----------------------------------------------------------------------------------{{{
    let g:posero_default_mappings = 1
" }}}

" Snippets" -----------------------------------------------------------------------------{{{
" Generic
    "iabbr {{ {}<esc>
    "iabbr (( ()<esc>

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
    " include system headers
    iabbr inc #include <><esc><left>
    " include local headers
    iabbr linc #include ""<esc><left>

    "Bootstrap
    au Filetype html,pug iabbr btnsucc btn-success
    au Filetype html,pug iabbr gly glyphicon

    "Canonical bugs
    nnoremap <leader>cb i+bug<space><esc>EvT/yea)<esc>Bi[bug#<esc>pa](<esc>A<space>[notes](<esc>abug-<esc>pa)
" }}}

" Generic Mappings ----------------------------------------------------------------------{{{

" set filetype markdown<->vimwiki
nnoremap <leader>stm <esc>:set filetype=markdown<cr>
nnoremap <leader>stv <esc>:set filetype=vimwiki<cr>
nnoremap <leader>o <C-w>o

" Dump web page
command! -nargs=1 GetUrl :r!lynx -dump -justify=off -width=100 -nolist <f-args>

" Grep from index a daily report of tasks created, moved, done
command! DoReport :r!grep -i -e ^#.*todo -e ^#.*wait -e ^#.*done ~/Dropbox/Notes/index.md
" }}}

" FileTypes customizations" -------------------------------------------------------------{{{
    autocmd FileType c,cpp nmap silent <leader>d [i
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal foldnestmax=2
    autocmd FileType python setlocal makeprg=pytest

    autocmd Syntax vim setlocal foldmethod=marker
    autocmd Syntax vim setlocal foldlevel=0
    autocmd Syntax vim setlocal modelines=1
"}}}

" Generic sofware development" ----------------------------------------------------------{{{
    set number            " Show line numbers
    set colorcolumn=0     " Show a colored line at the Nth column
    set nocursorline      " Disable highlight current line

    " Auto add closing bracket
    inoremap {<CR>  {<CR>}<Esc>O
    inoremap {<Tab>  {}<Left>

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
    "let g:clang_library_path='/usr/lib/llvm-4.0/lib/libLLVM-4.0.so.1'
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow

    " Letsdo mapping
    nnoremap <leader>ld <esc>:!letsdo --ascii<space>

    " Syncopate
    command! CopyFormat SyncopateExportToClipboard

    " Tab policy
    command! Set2TabSpace :set ts=2 sts=2 sw=2
    command! Set4TabSpace :set ts=4 sts=4 sw=4

    " Cmake
    command! Cmake :cd build | make | cd -

    " Show GTK documentation
    autocmd Filetype c,css nmap <silent> <leader>gdoc :! devhelp -s "<cword>" &<CR><CR>

    " Move in lopen
    "nnoremap <localleader>ln <esc>:lnext<cr>
    "nnoremap <localleader>lp <esc>:lprev<cr>

    " Shortcut to restore session from  ~/.vim/session
    nnoremap <leader>session <esc>:source ~/.vim/sessions/

    " Show alternate file (ex. .c/.cpp <-> .h)
    nnoremap <space>a :FSHere<cr>
    nnoremap <space>al :FSSplitRight<cr>
"}}}

"" Letsdo bindings ----------------------------------------------------------------------{{{

    nnoremap <leader>ld :!lets do<space>
    nnoremap <leader>ls :!lets stop<space>
    nnoremap <leader>lv :!lets see<space>
    nnoremap <leader>lc :!lets cancel<space>
    nnoremap <leader>le :!lets edit<space>
" }}}
