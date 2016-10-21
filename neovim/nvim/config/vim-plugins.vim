Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim' " Replacement for vimgrep
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/Mark--Karkat', {'on': 'Mark'} " Highlight several words in different colors simultaneously
Plug 'ludovicchabant/vim-gutentags' " A Vim Plug that manages your tag files
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gnupg.vim'
Plug 'Tagbar'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'} " Distraction free editing toggle :Goyo, end :Goyo!

" Completion and Linting
    Plug 'Shougo/deoplete.nvim' | Plug 'zchee/deoplete-clang'
    Plug 'neomake/neomake'

" GIT
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'

 " Go
    Plug 'fatih/vim-go', {'for': 'go'}

" GTD
    Plug 'vim-jp/vital.vim'
    Plug 'termoshtt/toggl.vim'
    Plug 'wakatime/vim-wakatime'    " Track working time

" Colorthemes
    Plug 'fatih/molokai'
    Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'morhetz/gruvbox'
    Plug 'ryanoasis/vim-devicons'


" Python
    Plug 'davidhalter/jedi', {'for': 'python'}
    Plug 'davidhalter/jedi-vim', {'for': 'python'}

" C/C++
    Plug 'a.vim', {'for': ['c', 'cpp']}
    Plug 'chazy/cscope_maps', {'for': ['c', 'cpp']}
    Plug 'hari-rangarajan/CCTree', {'for': ['c', 'cpp']} " C Call-Tree Explorer -- Cscope based source-code browser; code flow analyzer
    Plug 'vim-scripts/glib.vim', {'for': ['c', 'cpp']}
    Plug 'vim-utils/vim-man', {'for': ['c', 'cpp']}

" Foo
    Plug 'szw/vim-g'    " Quick Google lookup

" HTML
    Plug 'alvan/vim-closetag', {'for': 'html'}

