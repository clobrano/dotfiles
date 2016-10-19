#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -u
PWD=$(pwd)
KEYBINDINGS=keybindings.tmux

cp $HOME/.byobu/$KEYBINDINGS $HOME/.byobu/$KEYBINDINGS.bak
ln -sf "$PWD"/$KEYBINDINGS $HOME/.byobu/$KEYBINDINGS
