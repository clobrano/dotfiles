nmap <F2> :NERDTreeToggle<CR>

" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=0
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
