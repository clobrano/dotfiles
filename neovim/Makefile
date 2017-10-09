# Makefile for installing and configuring VIM
NVIM  := $(shell command -v nvim 2> /dev/null)
XCLIP := $(shell command -v xclip 2> /dev/null)

CWD			= $(shell pwd)
SRC			= $(CWD)/../vim/vim

NVIM_HOME	= $(HOME)/.config/nvim
INIT		= $(NVIM_HOME)/init.vim

.PHONY: install

all: add_repo install configure

add_repo:
	sudo apt-get install -y software-properties-common
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt-get update

install:
	-sudo apt-get install -y curl
ifndef NVIM
	sudo apt-get install -y neovim
endif
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
	pip install --user neovim
ifndef XCLIP
	sudo apt-get install -y xclip
endif

configure:
	[ -d $(NVIM_HOME) ]				|| mkdir $(NVIM_HOME)
	[ -L $(INIT) ]					|| ln -s $(SRC)/init.vim	$(INIT)
	[ -L $(NVIM_HOME)/config ]		|| ln -s $(SRC)/config		$(NVIM_HOME)/config
	[ -L $(NVIM_HOME)/colors ]		|| ln -s $(SRC)/colors		$(NVIM_HOME)/colors
	[ -L $(NVIM_HOME)/thesaurus ]	|| ln -s $(SRC)/thesaurus	$(NVIM_HOME)/thesaurus
	[ -L $(NVIM_HOME)/snippets ]	|| ln -s $(SRC)/snippets	$(NVIM_HOME)/snippets
	[ -L $(NVIM_HOME)/after ]		|| ln -s $(SRC)/after		$(NVIM_HOME)/after
	[ ! -f $(NVIM_HOME)/autoload/plug.vim ] && curl -fLo $(NVIM_HOME)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

clean:
ifdef NVIM
	-sudo apt-get purge neovim
endif
	-sudo rm -r $(NVIM_HOME)
