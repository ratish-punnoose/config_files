# Makefile

help:
	@echo "Help: make <target> where target is one of:"
	@echo "      update:  Updates packages"
	@echo "      all:    Generates init.org -> init.el -> init.elc"

all: init.elc

init.el: init.org
	emacs --script "inittangle.el"

init.elc: init.el
	emacs --batch --eval='(progn (load-file "init.el")(byte-compile-file "init.el"))'

update:
	rm -f init.elc init.el
	emacs --script "inittangle.el"
	emacs --script "update.el"
