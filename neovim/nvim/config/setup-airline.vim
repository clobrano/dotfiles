" Airline
let g:airline_theme='PaperColor'

let g:airline_powerline_fonts=1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
let g:airline_section_c = '%<%.40F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
set laststatus=2

