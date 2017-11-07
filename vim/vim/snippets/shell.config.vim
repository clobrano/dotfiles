command! Optgen r !~/.vim/snippets/optgen.sh/optgen.sh -s %
" Redirect to syslog
iabbr redsys exec 1> >(logger -s -t $(basename $0)) 2>&1
