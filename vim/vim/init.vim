
" Vim-plug plugin manager ----------{{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif
call plug#begin()

" Search & Replace
Plug 'MattesGroeger/vim-bookmarks'
Plug 'derekwyatt/vim-fswitch'
Plug 'junegunn/fzf',                     { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat',         { 'on': 'Mark'}
Plug 'szw/vim-g'                    " Quick Google lookup
Plug 'vim-scripts/taglist.vim'

" Look & Feel
Plug 'NLKNguyen/papercolor-theme'
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text and Code Checking/Linting
Plug 'chrisbra/Colorizer',               {'for': ['css', 'sass', 'scss']}
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdcommenter'
Plug 'igankevich/mesonic'
Plug 'junegunn/vim-easy-align'

" C/C++
Plug 'chazy/cscope_maps',                {'for': ['c', 'cpp']}
Plug 'hari-rangarajan/CCTree',           {'for': ['c', 'cpp']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'vim-utils/vim-man',                {'for': ['c', 'cpp']}
Plug 'vim-scripts/DoxygenToolkit.vim',   {'for': ['c', 'cpp']}

" GIT helpers
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Go
Plug 'fatih/vim-go',                     {'for': 'go'}
Plug 'ctrlpvim/ctrlp.vim',               { 'for': 'go'}

" Markdown/Notes
Plug 'plasticboy/vim-markdown',          {'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc',         {'for': 'markdown'}
Plug 'vim-jp/vital.vim'

" NodeJS
Plug 'moll/vim-node',                    {'for': 'javascript'}
Plug 'guileen/vim-node-dict',            {'for': 'javascript'}

" Javascript
Plug 'pangloss/vim-javascript',          {'for': 'javascript'}
Plug 'digitaltoad/vim-pug',              {'for': 'pug'}

" Python
Plug 'davidhalter/jedi',                 {'for': 'python'}
Plug 'davidhalter/jedi-vim',             {'for': 'python'}

" Generics
Plug 'aklt/plantuml-syntax'
Plug 'AndrewRadev/exercism.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

call plug#end()

set nocompatible
" Let allow buffers to be hidden when not already saved (do I really need this?)
set hidden
" }}}

let mapleader = ' '

" BASIC CONFIGURATION
" Init.vim edit and reload ---------{{{
command! Einit edit ~/.vimrc
nnoremap <silent> <leader>v :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <silent> <leader>V :source ~/.vimrc<CR>:PlugInstall<CR>:exe ":echo 'vimrc reloaded'"<CR>
" }}}
" Editor ---------------------------{{{
syntax enable
filetype on

set linespace=1
set thesaurus+=~/.vim/thesaurus/thesaurus.txt

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  set guifont=Source\ Code\ Pro\ for\ Powerline
else
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
  nnoremap <leader>ef <esc>:set guifont=Source\ Code\ Pro\ for\ Powerline\<space>
  colorscheme pencil
  set lines=35 columns=150
endif
command! Parens highlight MatchParen gui=bold guibg=NONE guifg=magenta
command! Pencil :colorscheme pencil | set background=light
command! Papercolor :colorscheme PaperColor | :set background=light
command! Onedark :colorscheme onedark | :set background=dark | Parens
command! Monokai :colorscheme monokai | :AirlineTheme onedark | Parens
command! Kolor :colorscheme kolor | Parens
command! SpellEn set spell spelllang=en
command! SpellIt set spell spelllang=it

" }}}
" System settings ------------------{{{
set mouse=a
set clipboard+=unnamedplus
set showcmd                    " show last command in the very bottom right of VI
set wildmenu                   " graphical menu of autocomplete matches
set wildmode=list:longest,full
" ------------------------------------------ UI config
set guioptions-=T " Remove toolbar
set scrolloff=10   " Keeping the cursor away from the last line make it easy to scroll down/up.
set relativenumber
hi clear CursorLine
set cursorline
hi CursorLineNR cterm=bold
set noshowmode " Let airline show my status
" ------------------------------------------ Autosave setup
set nobackup
set noswapfile
set autowrite
" ------------------------------------------ Autocomplete setaway fromset completeopt=longest,menu,preview
" Block select not limited to shortest line
set completeopt=longest,menu,preview
set virtualedit=
set laststatus=2 lazyredraw
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
set lcs=trail:Â·,tab:Â»Â· " Highlight spaces, tabs, end of line chars, wrap and brake lines
set wrap linebreak nolist
set list
set showbreak=â””
set showmatch
"highlight ExtraWhitespace ctermbg=Yellow
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
nnoremap <leader>ss :ToggleStripWhitespaceOnSave<CR>
" Reload open buffers
nnoremap <leader>r :checktime<cr>
" ------------------------------------------ Insert the current date long and short (insert mode, normal/command mode)
map <leader>d a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
inoremap <A-d> <C-R>=strftime("%y%W%u")<CR>
map <A-d> a<C-R>=strftime("%y%W%u")<CR><Esc>
"}}}
" System mappings ------------------{{{

" redo last command
"nnoremap <leader>r :<Up>
" Fix weird chars in terminal using arrow keys (INSERT mode)
inoremap [1;5A <esc>ki
inoremap [1;5C <esc>li
inoremap [1;5B <esc>ji
inoremap [1;5D <esc>hi
" ------------------------------------------ Esc button is too far and No Ex mode
inoremap jj <Esc>
inoremap <c-space> <Esc>
nnoremap Q <nop>
" ------------------------------------------ Navigation
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj
" Remap fast moves
nnoremap <C-l> 20l
nnoremap <C-h> 20h
nnoremap <C-k> 10k
nnoremap <C-j> 10j
nnoremap E g_
vnoremap E g_
nnoremap B ^
vnoremap B ^
" Open previous buffer
nnoremap <leader>p <C-^>
" ------------------------------------------ Copy & Paste as normal people (in progress)
vnoremap <C-c> "+y<CR>
nnoremap <C-p> "+p
xnoremap <silent> p p:let @+=@0<CR>
vnoremap <m-c> "+y<CR>
inoremap <m-v> <esc>"+p
noremap  <m-v> "+p
nnoremap <leader>va ggvGE
" select all
let @a='ggvGE'
" ------------------------------------------ Align blocks of text
vmap < <gv
vmap > >gv
nnoremap > >>
nnoremap < <<
" ------------------------------------------ Search & Replace
set ignorecase
set incsearch " search as characters are entered
set hlsearch " highlight matches
set backspace=indent,eol,start " Fix backspace misbehavior
set grepprg=ack
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ackprg = 'ag'
endif
let g:ack_default_options = " -s -H --nogroup --column --smart-case --follow"
let g:ackhighlight = 1
noremap rep <Esc>:%s//gc<Left><Left><Left>
" Highlight current word
nnoremap * *<C-o>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
highlight Search gui=underline
nnoremap <leader><space> :nohlsearch<CR>
" Look for text in current buffer
nnoremap fb <Esc>:g//#<left><left>
vnoremap fb y:g/<C-r>"/#<CR>
" ------------------------------------------ Find or go to Next/Prev match
nnoremap fn <esc>/
vnoremap fn y/<C-r>"<cr>
nnoremap fp <esc>?
vnoremap fp y?<C-r>"<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
" ------------------------------------------ Fzf fuzzy searcher (ff = find file)
if has('nvim')
    nnoremap <leader>ff <esc>:FZF<cr>
    cabbr ! term
else
    nnoremap <leader>ff <esc>:FZF<cr>
endif
nnoremap fa <Esc>:Ack! --ignore-dir=TAGS --ignore-dir=tags --ignore-dir=cscope.* ""<left>
nnoremap fc <Esc>:Ack! --ignore-dir=TAGS --ignore-dir=tags --ignore-dir=cscope.* ""<left><C-r><C-w>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" ------------------------------------------ Make
nnoremap <F5> <esc>:make<cr>
" }}}
" Buffers --------------------------{{{
" ------------------------------------------ Save, Close and Force close current buffer
inoremap <C-s> <Esc>:w<CR>
noremap <C-s> <Esc>:w<CR>
nnoremap x <Esc>:bd
nnoremap xx <Esc>:bd<CR>
nnoremap fx <Esc>:bd!<CR>
" close preview window
nnoremap xp <C-w>z<CR>
nnoremap xl <C-w>l:bd<CR>
nnoremap xh <C-w>h:bd<CR>
nnoremap xj <C-w>j:bd<CR>
nnoremap xk <C-w>k:bd<CR>
" Close quickfix window only
nnoremap <leader>x :cclose<cr>
nnoremap qa <esc>:qa
" Maximize current window
nnoremap <C-w>m <C-w>\|<C-w>_
" Keep only current window
nnoremap <leader>o <C-w>o

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
" ------------------------------------------ Move among buffers
nnoremap <A-w> <C-w>
noremap <A-Left> <Esc>:bp<CR>
noremap H <Esc>:bp<CR>
noremap <A-Right> <Esc>:bnext<CR>
noremap L <Esc>:bnext<CR>
nnoremap <c-b> <esc>:b<space>
" Convert horizontal splits to vertical and vice versa
nnoremap <leader>htv <C-w>t<C-w>H
nnoremap <leader>vth <C-w>t<C-w>K
" ------------------------------------------ Tabs
nnoremap <C-S-t> :tabnew<CR>
nnoremap <leader>ta <Esc>:tabnew<CR>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
set splitright " Style open split on the right
set splitbelow
" }}}
" File exploring -------------------{{{
set path+=**
cabbr fn find *
let g:netrw_winsize = -28             " absolute width of netrw window
let g:netrw_liststyle = 3             " treetest-view
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
let g:netrw_preview = 0
let g:netrw_banner=0
nnoremap <leader>e <esc>:Lexplore<cr>
command! Sethere lcd %:p:h
nnoremap <leader>h <Esc>:Sethere<CR>
" }}}
" Folding --------------------------{{{
set foldenable
set foldmethod=syntax
set foldlevel=99
nnoremap za zA
nnoremap zM zm
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

" EXTRAS
" SW Develop -----------------------{{{
set number            " Show line numbers
" Show a colored line at the 101st column, only on lines that overcome that measure
set colorcolumn=0
call matchadd('ColorColumn', '\%101v', 100)

set nocursorline      " Disable highlight current line
" Auto add closing bracket
inoremap {<CR>  {<CR>}<Esc>O
inoremap {<Tab>  {}<Left>
" Align function arguments
set cino+=(0
" Make install
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" Shortcut to save current session in ~/.vim/session
function! SaveSession()
    let cwd = getcwd()
    let session_name = fnamemodify(cwd, ':p:h:t')
    execute "mksession! ~/.vim/sessions/" . session_name
    echo 'saved session: ' . session_name
endfunction
command! SaveSession call SaveSession()

" Show the value of basic configuration options
function! CheckSession()
    exec "set list?|set expandtab?|set shiftwidth?|set tabstop?"
endfunc
" Shortcut to restore session from  ~/.vim/session
nnoremap <leader>session <esc>:source ~/.vim/sessions/
autocmd SessionLoadPost * call CheckSession()
" Show alternate file (ex. .c/.cpp <-> .h)
nnoremap <space>a :FSHere<cr>
nnoremap <space>al :FSSplitRight<cr>

" Jump to next/prev error
nnoremap [e :lprev<cr>
nnoremap ]e :lnext<cr>

" Jump to next/prev build error
nnoremap [b :cprev<cr>
nnoremap ]b :cnext<cr>

" Show variale definition
nnoremap I [i
" Open preview window on current name
nnoremap D <C-w>}

" Zeal offline documentation browser
nnoremap <leader>fz :silent !zeal "<cword>" &<CR><CR>

" Align text
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ea  <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea  <Plug>(EasyAlign)
" }}}
" Airline --------------------------{{{
let g:airline_symbols_ascii = 1

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_c = '%<%.40F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#whitespace#enabled = 1
let airline#extensions#syntastic#stl_format_err = '%E{%e}'
let airline#extensions#syntastic#stl_format_warn = '%W{%w}'
" }}}
" Cscope ---------------------------{{{
if has("cscope")
    command! CscopeMake !find . -name '*.c' -o -name '*.cpp' -o -name '*.h' > cscope.files && cscope -b -i cscope.files
    command! CscopeLoad cs add cscope.out
    function! _TagsReload()
        exec "!rm cscope.files cscope.out"
        exec "CscopeMake"
        exec "cscope reset"
        exec "CtagsMake"
    endfunction
    command! TagsReload :call _TagsReload()
    nnoremap <leader>tr :silent TagsReload<cr>
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
set cscopetag nocscopeverbose
" Quickfix window for cscope in place of interactive window
if has('quickfix')
    "set cscopequickfix=c-,d-,e-,f-,g-,i-,t-,s-
endif
nnoremap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fd :cs find g <C-R>=expand("<cword>")<CR><CR>
command! CallTree :CCTreeTraceReverse
"}}}
" Ctags ----------------------------{{{
command! CtagsMake !ctags -R --extra=+f --exclude=.git .
"Makes ctags visible from subdirectories
set tags=tags;/
noremap T <Esc>:tag<space>
" Move to next tag
noremap <C-[> <C-o>
" Open Tag in vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" }}}
" TagList --------------------------{{{
nnoremap <leader>to :TlistOpen<cr>
nnoremap <leader>tc :TlistClose<cr>
    "let Tlist_Display_Prototype=0
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_Show_One_File=1
" }}}
" FZF ------------------------------{{{
if has('nvim')
    let g:fzf_launcher = 'xterm -T fzf -fa monaco -fs 10 -e bash -ic %s'
endif
" New shortcuts for fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fl :BLines<cr>
"nnoremap fa :Ag<cr>
" }}}
" Getting Things Done --------------{{{
command! Todo :-1r ~/dotfiles/vim/vim/snippets/todo.md
" Task Done, Up, Later, Next, change Prio
nnoremap td dd/^#.*Done<esc>p^a <C-R>=strftime("%y%W%u")<CR><esc>
nnoremap tu dd?^#<cr>p<leader><space>
nnoremap tl dd/^#.*Later<esc>p^a <C-R>=strftime("%y%W%u")<CR><esc>
nnoremap tn dd?^#.*Todo<esc>p^a<esc>
nnoremap tpa v$:s/([A-C])/(A)/g<CR>
nnoremap tpb v$:s/([A-C])/(B)/g<CR>
nnoremap tpc v$:s/([A-C])/(C)/g<CR>

cabbr _sortPj sort '+[a-zA-z]*' r
cabbr _sortPr sort '([A-Z])' r
cabbr _sortCx sort '@[a-zA-z]*' r

"}}}
" Git ------------------------------{{{
nnoremap <leader>gs <esc>:Gina status<cr>
nnoremap <leader>gl <esc>:Gina log<cr>
nnoremap <leader>ga <esc>:Gina add %
nnoremap <leader>gc <esc>:Gina commit<cr>
nnoremap <leader>gph <esc>:Gina push<cr>
nnoremap <leader>gpl <esc>:Gina pull<cr>

cabbr _gam !git commit --amend
cabbr _gamn !git commit --amend --no-edit
cabbr greview Git push origin HEAD:refs/for/

nnoremap <leader>gpr <esc>:Git push origin HEAD:refs/for/
" Shortcut for Fugitive vertical diff
nnoremap <leader>gd <esc>:Gvdiff<space>
" }}}
" Golang ---------------------------{{{
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
" Jedi-vim -------------------------{{{
"let g:jedi#force_py_version=3
let g:jedi#completions_command = "<C-n>"
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<space>fd"
let g:jedi#usages_command = "<space>fd"

" }}}
" Letsdo ---------------------------{{{

nnoremap <leader>ld :!lets do<space>
nnoremap <leader>ls :!lets stop<space>
nnoremap <leader>lv :!lets see<space>
nnoremap <leader>lc :!lets cancel<space>
nnoremap <leader>le :!lets edit<space>
" }}}
" Mark -----------------------------{{{
vnoremap {Leader}/  n
nnoremap <leader>n <Plug>Mark
set nocscopeverbose
" }}}
" Markdown -------------------------{{{
autocmd FileType markdown set conceallevel=2
"autocmd FileType markdown source ~/dotfiles/vim/vim/after/syntax/markdown.vim
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_follow_anchor = 1
command! Writer :source ~/dotfiles/vim/vim/config/writer.vim
" }}}
" Syntastic ------------------------{{{
set statusline+=%#warningmsg#                                   "syntastic
set statusline+=%{SyntasticStatuslineFlag()}                    "syntastic
set statusline+=%*                                              "syntastic
let g:syntastic_always_populate_loc_list = 1                    "syntastic
let g:syntastic_auto_loc_list = 0                               "syntastic
let g:syntastic_check_on_open = 1                               "syntastic
let g:syntastic_check_on_wq = 0                                 "syntastic
let g:syntastic_c_checkers=['clang_check', 'cppcheck']
let g:syntastic_cpp_checkers=['clang_check', 'cppcheck']
let g:syntastic_python_checkers=['flake8']
" }}}
" Snippets -------------------------{{{
augroup Shebang
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: UTF-8 -*-\<nl>\"|$
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl># vi: set ft=python :\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

source ~/dotfiles/vim/vim/snippets/browser.config.vim
source ~/dotfiles/vim/vim/snippets/c_cpp.config.vim
source ~/dotfiles/vim/vim/snippets/canonical.config.vim
source ~/dotfiles/vim/vim/snippets/licenses.config.vim
source ~/dotfiles/vim/vim/snippets/python.config.vim
source ~/dotfiles/vim/vim/snippets/shell.config.vim

nnoremap <leader>1 :Make<cr>

iabbr editorconfig <esc>:-1 r~/dotfiles/vim/vim/snippets/editorconfig/template.vim

cabbr _email !git send-email --smtp-encryption tls --smtp-server smtp.gmail.com --smtp-user $SMTP_USER --smtp-pass $SMTP_PASS --smtp-server-port 587 --8bit-encoding UTF-8 --to "$TO" --from "$FROM" %
cabbr rilh e ~/workspace/hikey7/hardware/ril/reference-ril/ril.h

" In diff mode, move to the next/previous diff and center the screen
nnoremap <leader>cc ]czz
nnoremap <leader>C [czz
" }}}
" Tabular --------------------------{{{
vnoremap <silent> <Leader>cee    :Tabularize /=<CR>              "tabular
vnoremap <silent> <Leader>cet    :Tabularize /#<CR>              "tabular
vnoremap <silent> <Leader>ce     :Tabularize /
" }}}
" Terminal -------------------------{{{
if has("nvim")
tnoremap qq <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
command! TerminalH :new  | resize 10 | terminal
command! TerminalV :vnew | terminal
nnoremap <leader>th :TerminalH<cr>
nnoremap <leader>tv :TerminalV<cr>
endif
" shortcut to write ".*" when searching with regex in terminal
cabbr .. .*
" }}}
" Notes ----------------------------{{{
" Make a markdown link
let @l='S]f]a()jjh'
" Make markdown bold
let @b='S*a*jjf*i*'
" Make markdown italic
let @i='S*ajjf*'
" Make a note from a todo
let @n='llvEywwwvE@lp€ýb€ýa'

command! Journal :-1r ~/dotfiles/vim/vim/snippets/journal/journal.md | :set ro
" }}}
" Exercism -------------------------{{{
cabbr exercd term exercism download --track=c --exercise=
cabbr exercs term exercism submit<space>
" }
" ULM ------------------------------{{{
au FileType plantuml nnoremap <Leader>pr :silent !plantuml %<cr>
" }
let g:solarized_contrast="high"
