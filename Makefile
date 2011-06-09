usage:
	@echo "usage: make [install]"

install: ackrc gitconfig
	ln -sf $$(pwd)/ackrc $(HOME)/.ackrc
	ln -sf $$(pwd)/aliases $(HOME)/.aliases
	ln -sf $$(pwd)/bashrc $(HOME)/.bashrc
	ln -sf $$(pwd)/bash_profile $(HOME)/.bash_profile
	ln -sf $$(pwd)/gitconfig $(HOME)/.gitconfig
	ln -sf $$(pwd)/minicpanrc $(HOME)/.minicpanrc
