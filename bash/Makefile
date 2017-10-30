## Makefile for bash configuration
PWD=$(shell pwd)
DOTFILE_DIR=$(shell dirname ${PWD})
BASHRC=$(HOME)/.bashrc
BASHRC_BAK=$(HOME)/.bashrc.bak

all: .inputrc set_bashrc gitconfigure tilixconfigure

powershell:
	pip install powerline-shell --user
	cp powerline-shell.json ${HOME}/.powerline-shell.json

.inputrc:
	./create_inputrc

set_bashrc: bashrc bash_prompt.py
	-mv $(BASHRC) $(BASHRC_BAK)
	cp $(PWD)/bashrc $(BASHRC)
	sed -i 's_PLACEHOLDER_$(DOTFILE_DIR)_g' $(BASHRC)

gitconfigure:
	./git_configuration.sh

tilixconfigure:
	./tilix.configure.sh

clean:
	-[ -f .inputrc ] && rm .inputrc || echo "No inputrc found"
	-[ -f $(BASHRC_BAK) ] && mv -f $(BASHRC_BAK) $(BASHRC)
