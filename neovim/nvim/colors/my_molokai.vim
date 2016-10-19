"these lines are suggested to be at the top of every colorscheme
hi clear
"if exists("syntax_on")
"  syntax reset
"endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/molokai.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my_molokai"

"Clear the colors for any items that you don't like
"hi clear StatusLine
"hi clear StatusLineNC

"Set up your new & improved colors
hi Search ctermbg=228 ctermfg=black guifg=NONE guibg=NONE guifg=orange guibg=NONE gui=bold
