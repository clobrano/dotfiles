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
	sudo apt-get install -f curl
	sudo apt-get install -y python3-dev python3-pip
endif

configure: install
	[ -d $(VIM_HOME) ]				|| mkdir $(VIM_HOME)
	[ -L $(VIMRC) ]					|| ln -s $(CWD)/vim/init.vim		$(VIMRC)
	[ -L $(VIM_HOME)/config ]		|| ln -s $(CWD)/vim/config			$(VIM_HOME)/config
	[ -L $(VIM_HOME)/colors ]		|| ln -s $(CWD)/vim/colors			$(VIM_HOME)/colors
	[ -L $(VIM_HOME)/thesaurus ]	|| ln -s $(CWD)/vim/thesaurus		$(VIM_HOME)/thesaurus
	[ -L $(VIM_HOME)/snippets ]		|| ln -s $(CWD)/vim/snippets		$(VIM_HOME)/snippets
	[ -L $(VIM_HOME)/after ]		|| ln -s $(CWD)/vim/after		    $(VIM_HOME)/after
	ln -sf $(CWD)/ctags.config $(HOME)/.ctags
	[ ! -f $(VIM_HOME)/autoload/plug.vim ] && curl -fLo $(VIM_HOME)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

clean:
	-sudo rm -r $(VIM_HOME)
	-rm $(VIMRC)
