usage:
	@echo "usage: make [install]"

install stow:
	stow -vv --target=${HOME} bash
	stow -vv --target=${HOME} misc
	stow -vv --target=${HOME} vim
