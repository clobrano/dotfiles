" =============================================================================
" This file contains shortcut for Copy, Paste, Search and Replace chunks of
" text

" =========================================
"Copy&Paste from system register"
vnoremap <M-c> "+y
noremap <M-v> "+p
inoremap <M-v> <Esc>"+p

" =============================================================================
" Search and Replace

set ignorecase      " Usually I prefer search with ignorecase
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set wildignorecase  " autocomplete ignorecase in ex-mode (cmd line)
set backspace=indent,eol,start  " Fix backspace misbehavior

set grepprg=ack     " ack will be our grep program
let g:ackprg = 'ag'
let g:ack_default_options =
              \ " -s -H --nogroup --column --smart-case --follow"
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
nnoremap fa <Esc>:Ack! 
" Look for file that match a pattern
nnoremap ff <Esc>:Ex **/
" Search pattern and replace (sed like syntax)
" TODO: change shortcut?
noremap rep <Esc>:%s//gc<Left><Left><Left>

" Command to add the current date (insert mode, normal/command mode)
inoremap <A-d> <C-R>=strftime("%Y-%m-%d")<CR>
map <A-d> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>


