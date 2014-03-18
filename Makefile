
   cwd := $(shell pwd)

usage:
	@echo "usage: make [install]"

install: ackrc gitconfig
	cp ./gitconfig            $(HOME)/.gitconfig
	ln -sf $(cwd)/ackrc $(HOME)/.ackrc
	ln -sf $(cwd)/aliases $(HOME)/.aliases
	ln -sf $(cwd)/cvsrc $(HOME)/.cvsrc
	ln -sf $(cwd)/bashrc $(HOME)/.bashrc
	ln -sf $(cwd)/bash_profile $(HOME)/.bash_profile
	ln -sf $(cwd)/gitconfig $(HOME)/.gitconfig
	ln -sf $(cwd)/minicpanrc $(HOME)/.minicpanrc
	ln -sf $$(pwd)/ackrc          $(HOME)/.ackrc
	ln -sf $$(pwd)/aliases        $(HOME)/.aliases
	ln -sf $$(pwd)/cvsrc          $(HOME)/.cvsrc
	ln -sf $$(pwd)/bashrc         $(HOME)/.bashrc
	ln -sf $$(pwd)/bashrc.d       $(HOME)/.bashrc.d
	ln -sf $$(pwd)/bash_profile   $(HOME)/.bash_profile
	ln -sf $$(pwd)/minicpanrc     $(HOME)/.minicpanrc
	ln -sf $$(pwd)/perltidyrc     $(HOME)/.perltidyrc
	ln -sf $$(pwd)/psqlrc         $(HOME)/.psqlrc
	ln -sf $$(pwd)/tmux.conf      $(HOME)/.tmux.conf
