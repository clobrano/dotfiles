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
	[ -d $(NVIM_HOME) ] 			  || mkdir $(NVIM_HOME)
	[ -L $(INIT) ] 					  || ln -s $(CWD)/nvim/init.vim  	$(INIT)
	[ -L $(NVIM_HOME)/config ] 		  || ln -s $(CWD)/nvim/config 	 	$(NVIM_HOME)/config
	[ -L $(NVIM_HOME)/colors ] 		  || ln -s $(CWD)/nvim/colors 	 	$(NVIM_HOME)/colors
	[ -L $(NVIM_HOME)/thesaurus ] 	  || ln -s $(CWD)/nvim/thesaurus 	$(NVIM_HOME)/thesaurus
	[ -L $(NVIM_HOME)/snippets ] 	  || ln -s $(CWD)/nvim/snippets  	$(NVIM_HOME)/snippets
	[ -L $(NVIM_HOME)/after/syntax ]  || mkdir -p $(NVIM_HOME)/after && ln -s $(CWD)/nvim/syntax 		$(NVIM_HOME)/after/syntax

clean:
ifdef NVIM
	-sudo apt-get purge neovim
endif
ifdef XCLIP
	-sudo apt-get purge xclip
endif
	-sudo rm -r $(NVIM_HOME)
