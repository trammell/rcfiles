usage:
	@echo "usage: make [clean|install]"

clean:
	@echo

install:
	mkdir -p $(HOME)/.vim/{doc,plugin}
	ln -sf $$(pwd)/vimrc.vim $(HOME)/.vimrc
	ln -sf $$(pwd)/vimau.vim $(HOME)/.vim/vimau.vim
	ln -sf $$(pwd)/ftplugin  $(HOME)/.vim/ftplugin
	ln -sf $$(pwd)/templates $(HOME)/.vim/templates
