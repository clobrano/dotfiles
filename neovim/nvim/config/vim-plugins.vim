" Generic
    Plug 'gnupg.vim'
    Plug 'ludovicchabant/vim-gutentags'             " A Vim Plug that manages your tag files
    Plug 'mileszs/ack.vim'                          " Replacement for vimgrep
    Plug 'vim-scripts/Mark--Karkat', {'on': 'Mark'} " Highlight several words in different colors simultaneously

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

" GIT
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


