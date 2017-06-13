PWD=$(pwd)
all: dependencies cache

dependencies:
	-mkdir ${HOME}/.fonts
	cp "${CWD}/Monaco_Linux-Powerline.ttf" ${HOME}/.fonts
	cp "${PWD}/Ubuntu Mono for Powerline Nerd Font Complete.ttf" ${HOME}/.fonts

cache:
	fc-cache -vf
