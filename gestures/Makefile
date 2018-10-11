## Makefile to install fusuma and gesture configuration file
PWD=$(shell pwd)

all: requirements install configure

requirements:
	sudo apt install libinput-tools
	sudo apt install xdotool
	sudo apt install ruby

install:
	sudo gem install fusuma

configure:
	-mkdir -p ~/.config/fusuma
	ln -s ${PWD}/config.yml ${HOME}/.config/fusuma/
