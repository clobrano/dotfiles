#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -e
set -x

which vim > /dev/null

if [ "$?" = 0 ]; then
    mkdir $HOME/.vim
    ln -sf $(pwd)/vim/init.vim  $HOME/.vimrc
    ln -sf $(pwd)/vim/config    $HOME/.vim/config
    ln -sf $(pwd)/vim/colors    $HOME/.vim/colors
    ln -sf $(pwd)/vim/thesaurus $HOME/.vim/thesaurus
    ln -sf $(pwd)/vim/snippets  $HOME/.vim/snippets
    sudo apt install xclip
else
    echo "VIM is not installed"
fi

