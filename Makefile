
   cwd := $(shell pwd)

usage:
	@echo "usage: make [install]"

  rcfiles = ackrc aliases cvsrc bashrc bash_profile gitconfig minicpanrc

install: ackrc gitconfig
	ln -sf $(cwd)/ackrc $(HOME)/.ackrc
	ln -sf $(cwd)/aliases $(HOME)/.aliases
	ln -sf $(cwd)/cvsrc $(HOME)/.cvsrc
	ln -sf $(cwd)/bashrc $(HOME)/.bashrc
	ln -sf $(cwd)/bash_profile $(HOME)/.bash_profile
	ln -sf $(cwd)/gitconfig $(HOME)/.gitconfig
	ln -sf $(cwd)/minicpanrc $(HOME)/.minicpanrc

#links: bin/symlink
#	ln -sf
#bin/symlink cvsrc
#bin/symlink perltidyrc
#bin/symlink psqlrc
#bin/symlink bashrc.d
