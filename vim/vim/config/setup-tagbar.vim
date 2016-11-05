noremap <F3> <Esc>:TagbarToggle<CR>
nnoremap tb <Esc>:TagbarToggle<CR>

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
