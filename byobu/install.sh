#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -u
PWD=$(pwd)
files="keybindings.tmux .tmux.conf status"

for f in $files; do
    cp $HOME/.byobu/$f $HOME/.byobu/$f.bak
    ln -sf "$PWD"/$f $HOME/.byobu/$f
done
#KEYBINDINGS=keybindings.tmux
#
#cp $HOME/.byobu/$KEYBINDINGS $HOME/.byobu/$KEYBINDINGS.bak
#ln -sf "$PWD"/$KEYBINDINGS $HOME/.byobu/$KEYBINDINGS
