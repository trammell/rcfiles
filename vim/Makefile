
usage:
	@echo "usage: make [clean|install]"

clean:

install:
	mkdir -p $(HOME)/.vim
	mkdir -p $(HOME)/.vim/{doc,plugin}
	ln -sf $$(pwd)/vimau.vim $(HOME)/.vim/vimau.vim
	ln -sf $$(pwd)/templates $(HOME)/.vim/templates

