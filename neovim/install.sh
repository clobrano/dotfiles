#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -e
set -x
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip

ln -s $(pwd)/nvim $HOME/.config/nvim
