# Makefile for installing and configuring VIM
NVIM  := $(shell command -v nvim 2> /dev/null)
XCLIP := $(shell command -v xclip 2> /dev/null)

CWD       = $(shell pwd)
NVIM_HOME = $(HOME)/.config/nvim
INIT      = $(NVIM_HOME)/init.vim

.PHONY: install

all: add_repo install configure

add_repo:
	sudo apt-get install -y software-properties-common
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt-get update

install:
ifndef NVIM
	sudo apt-get install -y neovim
endif
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
	pip install --user neovim
ifndef XCLIP
	sudo apt-get install -y xclip
endif

configure: install
	mkdir $(NVIM_HOME)
	ln -sf $(CWD)/nvim/init.vim  $(NVIM_HOME)/init.vim
	ln -sf $(CWD)/nvim/config 	 $(NVIM_HOME)/config
	ln -sf $(CWD)/nvim/colors 	 $(NVIM_HOME)/colors
	ln -sf $(CWD)/nvim/thesaurus $(NVIM_HOME)/thesaurus
	ln -sf $(CWD)/nvim/snippets  $(NVIM_HOME)/snippets

clean:
ifdef NVIM
	-sudo apt-get purge neovim
endif
ifdef XCLIP
	-sudo apt-get purge xclip
endif
	-sudo rm -r $(NVIM_HOME)
