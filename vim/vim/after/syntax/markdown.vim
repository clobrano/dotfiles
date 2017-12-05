" Custom colors for Todo.txt like highlight
syntax match TodoDate    '\d\{2,4\}-\d\{2\}-\d\{2\}'
syntax match TodoDate    '\d\{2,4\}/\d\{2\}/\d\{2\}'
syntax match TodoDate    '\d\{2\}-\d\{2\}'
syntax match TodoDate    '\d\{2\}/\d\{2\}'
syntax match TodoDate    '\d\{4\}/\d\{3\}'
syntax match TodoDate    '\d\{2\}/\d\{3\}'
syntax match TodoDueDate 'due:\d\{2,4\}-\d\{2\}-\d\{2\}'
syntax match TodoDueDate 'due:\d\{2\}-\d\{2\}'
syntax match TodoDueDate 'due:\d\{2\}/\d\{1,3\}'
syntax match TodoProject '\(^\|\W\)+[^[:blank:]]\+'
syntax match TodoContext '\(^\|\W\)@[^[:blank:]]\+'
syntax match TodoTag     '\(^\|\W\)#[^[:blank:]#]\+'

highlight default link TodoDate    String
highlight default link TodoDueDate VimWikiBold
highlight default link TodoProject Statement
highlight default link TodoContext Constant
highlight default link TodoTag     Error



