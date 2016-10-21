#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
set -e
set -x

which nvim > /dev/null

if [ "$?" = 1 ]; then
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim
  sudo apt-get install python-dev python-pip python3-dev python3-pip
else
  ln -s $(pwd)/nvim $HOME/.config/nvim
fi
curl -fLo "Ubuntu Mono for Powerline Nerd Font Complete.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf