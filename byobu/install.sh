#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -u
PWD=$(pwd)
BYOBU_HOME=$HOME/.byobu
files="keybindings.tmux .tmux.conf status"

for f in $files; do
    cp $HOME/.byobu/$f $HOME/.byobu/$f.bak
    ln -sf "$PWD"/$f $HOME/.byobu/$f
done
