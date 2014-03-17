
   cwd := $(shell pwd)

usage:
	@echo "usage: make [install]"

install:
	cp ./gitconfig  $(HOME)/.gitconfig
	ln -sf $(cwd)/ackrc          $(HOME)/.ackrc
	ln -sf $(cwd)/aliases        $(HOME)/.aliases
	ln -sf $(cwd)/cvsrc          $(HOME)/.cvsrc
	ln -sf $(cwd)/bashrc         $(HOME)/.bashrc
	ln -sf $(cwd)/bashrc.d       $(HOME)/.bashrc.d
	ln -sf $(cwd)/bash_profile   $(HOME)/.bash_profile
	ln -sf $(cwd)/gitconfig      $(HOME)/.gitconfig
	ln -sf $(cwd)/minicpanrc     $(HOME)/.minicpanrc
	ln -sf $(cwd)/perltidyrc     $(HOME)/.perltidyrc
	ln -sf $(cwd)/psqlrc         $(HOME)/.psqlrc
	ln -sf $(cwd)/tmux.conf      $(HOME)/.tmux.conf

