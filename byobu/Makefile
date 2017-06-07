## Makefile for byobu configuration

all: dependencies install.sh keybindings.tmux status
	./install.sh

dependencies:
	-git clone https://github.com/tmux-plugins/tpm 				$(HOME)/.byobu/plugins/tpm
	-git clone https://github.com/jimeh/tmux-themepack			$(HOME)/.byobu/plugins/tmux-themepack
	-git clone https://github.com/NHDaly/tmux-better-mouse-mode $(HOME)/.byobu/plugins/tmux-better-mouse-mode
