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
  mkdir $HOME/.config/nvim
  ln -sf $(pwd)/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -sf $(pwd)/nvim/config $HOME/.config/nvim/config
  ln -sf $(pwd)/nvim/colors $HOME/.config/nvim/colors
  ln -sf $(pwd)/nvim/thesaurus $HOME/.config/nvim/thesaurus
fi

font=./"Ubuntu Mono for Powerline Nerd Font Complete.ttf"
[ ! -f "$font" ] && curl -fLo "Ubuntu Mono for Powerline Nerd Font Complete.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf

sudo apt install xclip
pip2 install --user neovim
pip3 install --user neovim
