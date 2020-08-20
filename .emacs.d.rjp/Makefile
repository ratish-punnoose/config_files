# Makefile

help:
	@echo "Help: make <target> where target is one of:"
	@echo "      install:  Installs missing packages"
	@echo "      update:  Updates packages"
	@echo "      all:    Generates init.org -> init.el -> init.elc"

all: init.elc

init.el: init.org
	emacs --script "inittangle.el"

init.elc: init.el
	emacs --batch --eval='(progn (load-file "init.el")(byte-compile-file "init.el"))'

install: init.el
	rm -f init.elc  package-quickstart.el
	emacs --script "update.el"

update: init.el
	rm -f init.elc package-quickstart.el
	emacs --script "update.el" force
