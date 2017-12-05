" Custom colors for Todo.txt like highlight
syntax match TodoDate    "\d\{2,4\}-\d\{2\}-\d\{2\} "
syntax match TodoDate    "\d\{2,4\}/\d\{2\}/\d\{2\} "
syntax match TodoDate    "\d\{2\}-\d\{2\} "
syntax match TodoDate    "\d\{2\}/\d\{2\} "
syntax match TodoDate    "\d\{4\}/\d\{3\} "
syntax match TodoDate    "\d\{2\}/\d\{3\} "
syntax match TodoDueDate "due:\d\{2,4\}-\d\{2\}-\d\{2\} "
syntax match TodoDueDate "due:\d\{2\}-\d\{2\} "
syntax match TodoDueDate "due:\d\{2\}/\d\{1,3\} "
syntax match TodoProject " +[^[:blank:]]\+ "
syntax match TodoContext " @[^[:blank:]]\+ "
syntax match TodoTag     " #[^[:blank:]#]\+ "

highlight  default  link  TodoDate     Number
highlight  default  link  TodoProject  Statement
highlight  default  link  TodoContext  Constant
highlight  default  link  TodoTag      Error


