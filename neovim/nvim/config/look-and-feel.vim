" =============================================================================
" Look and feel

" =============================================================================
" UI config
set showcmd         " show last command in the very bottom right of VIM
set wildmode=list:longest
set guioptions-=T   " Remove toolbar, make space!
"set scrolloff=5     " Keep the cursor from reaching the last line make it easy to scroll down/up.

syntax enable

"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
set guifont=Monospace\ 11
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"
set linespace=1
command! Dark colorscheme gruvbox | set background=dark | AirlineTheme bubblegum
command! Light colorscheme PaperColor | set background=light | AirlineTheme PaperColor 
command! Set1 set guifont=Monaco\ for\ Powerline\ 10
command! Set2 set guifont=set guifont=Monospace\ 11

" Windows initial size
"set lines=50
"set columns=180

" Toggle Menu and toolbar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>


" =============================================================================
" Highlight spaces, tabs, end of line chars, wrap and brake lines
set list lcs=trail:·,tab:»· ",eol:¶
set linebreak
set wrap
set showbreak=└
set showmatch       " show matching parenthesis
let loaded_matchparen = 0
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"" Better whitespace color
highlight ExtraWhitespace ctermbg=Yellow


" =============================================================================
" Tabs & co.
" tabstop tells vim how may columns a tab counts for
set tabstop=4
" shiftwidth is the Number of spaces to use for each step of (auto)indent (used for >> << and cindent
set shiftwidth=4
" Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
set softtabstop=4
" expand tab will replace tab with spaces (unset here, since some guys use tabs)
"set noexpandtab
set expandtab

" =============================================================================
" Autocomplete setup
set completeopt=longest,menu,preview
set wildmenu        " graphical menu of autocomplete matches
set lazyredraw      " the screen will be redraw less often

" =============================================================================
" Autosave setup
set nobackup
set noswapfile
set autowrite


