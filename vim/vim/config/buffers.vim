" =============================================================================
" This file contains shortcut for Buffer/Window management like open, close and
" moving inside a buffer/window
" =============================================================================

" Save current buffer.
inoremap <C-s> <Esc>:w<CR>
noremap <C-s> <Esc>:w<CR>

" Clean close file and remove from buffer (fc: save&close, fq: close)
noremap <A-q> <Esc>:call CleanClose(0)<CR>
nnoremap Q <C-w>q

" Move among tabs in Konsole-style and to go to next buffer
noremap <A-Right> gt
noremap <A-k> <Esc>gt<CR>
noremap <A-Left> gT
noremap <A-j> <Esc>gT<CR>

" Move among buffers
noremap <C-Left> <Esc>:bp<CR>
noremap <C-h> <Esc>:bp<CR>
noremap <C-Right> <Esc>:bnext<CR>
noremap <C-l> <Esc>:bnext<CR>

" Move at the beginning/end of a line (b and e already move at the
" beginning/end of a word)
nnoremap B ^
nnoremap E $
" Disable $/^ completely
nnoremap $ <nop>
nnoremap ^ <nop>

" New Tab
nnoremap <C-S-t> :tabnew<CR>
inoremap <C-S-t> <Esc>:tabnew<CR>

" Open link in a browser (OpenURL plugin)
map <Leader>ow :call OpenURL()<CR>

set splitright  " style open split on the right

" =============================================================================
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

