# Makefile for installing and configuring VIM
VIM  := $(shell command -v vim 2> /dev/null)
GVIM := $(shell command -v gvim 2> /dev/null)
XCLIP := $(shell command -v xclip 2> /dev/null)

CWD      = $(shell pwd)
VIM_HOME = $(HOME)/.vim
VIMRC    = $(HOME)/.vimrc

.PHONY: install

all: install configure

install:
ifndef GVIM
	sudo apt-get install -f vim-gtk
	sudo apt-get install -f xclip
endif

configure: install
	@mkdir $(VIM_HOME)
	@ln -sf $(CWD)/vim/init.vim		$(VIMRC)
	@ln -sf $(CWD)/vim/config		$(VIM_HOME)/config
	@ln -sf $(CWD)/vim/colors		$(VIM_HOME)/colors
	@ln -sf $(CWD)/vim/thesaurus	$(VIM_HOME)/thesaurus
	@ln -sf $(CWD)/vim/snippets 	$(VIM_HOME)/snippets

clean:
	-sudo rm -r $(VIM_HOME)
	-rm $(VIMRC)
ifdef XCLIP
	-sudo apt-get purge xclip
endif
ifdef GVIM
	-sudo apt-get purge vim-gtk
endif
