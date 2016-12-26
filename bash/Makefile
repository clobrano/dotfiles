## Makefile for bash configuration
PWD=$(shell pwd)
BASHRC=$(HOME)/.bashrc
BASHRC_BAK=$(HOME)/.bashrc.bak

all: .inputrc link_bashrc

.inputrc:
	./create_inputrc

link_bashrc: bashrc bash_prompt.py
	mv $(BASHRC) $(BASHRC_BAK)
	ln -sf $(PWD)/bashrc $(BASHRC)

clean:
	-[ -f .inputrc ] && rm .inputrc || echo "No inputrc found"
	-[ -f $(BASHRC_BAK) ] && mv -f $(BASHRC_BAK) $(BASHRC)
