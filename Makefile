usage:
	@echo "usage: make [install]"

install stow:
	stow --target=${HOME} bash
