## This makefile belongs to the suite of file for configure, install, change and remove my dotfiles

SUBDIRS = bash byobu neovim vim fonts

.PHONY: subdirs $(SUBDIRS)

#--------------------------------------------------------
# Install programs and dependencies
# TODO


#--------------------------------------------------------
# Configure/Install subdirs
subdirs: $(SUBDIRS) ## Install all subdirectories

$(SUBDIRS):
	$(MAKE) -C $@


#--------------------------------------------------------
# Clean subdirs
SUBCLEAN = $(addsuffix .clean, $(SUBDIRS))

.PHONY: clean $(SUBCLEAN)

clean: $(SUBCLEAN) ## Clean all (subdirectories included)

$(SUBCLEAN): %.clean:
	$(MAKE) -C $* clean




