" Custom colors for Todo.txt like highlight
" YYYY-MM-DD
syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}'       contains=VimwikiTodo
" YYYY/MM/DD
syntax  match  TodoDate       '\d\{2,4\}/\d\{2\}/\d\{2\}'       contains=VimwikiTodo
" MM-DD
syntax  match  TodoDate       '\d\{2\}-\d\{2\}'                 contains=VimwikiTodo
" MM/DD
syntax  match  TodoDate       '\d\{2\}/\d\{2\}'                 contains=VimwikiTodo
" Data YYYY/Day-of-year
syntax  match  TodoDate       '\d\{4\}/\d\{3\}'                 contains=VimwikiTodo
" Data YY/Day-of-year
syntax  match  TodoDate       '\d\{2\}/\d\{3\}'                 contains=VimwikiTodo

syntax  match  TodoDueDate    'due:\d\{2,4\}-\d\{2\}-\d\{2\}'   contains=VimwikiTodo
syntax  match  TodoDueDate    'due:\d\{2\}-\d\{2\}'             contains=VimwikiTodo
syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'        contains=VimwikiTodo
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'        contains=VimwikiTodo
syntax  match  TodoTag        '\(^\|\W\)#[^[:blank:]#]\+'        contains=VimwikiTodo

hi def link TodoDate       String
hi def link TodoDueDate    VimWikiBold
hi def link TodoProject    Statement
hi def link TodoContext    Constant
hi def link TodoTag        Error


