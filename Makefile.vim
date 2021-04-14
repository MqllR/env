# vim:filetype=make

VUNDLEREPO=https://github.com/VundleVim/Vundle.vim.git

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: vimrc
vimrc:
	rm -f ${HOME}/.vimrc
	ln -s ${ROOT_DIR}/dotfiles/.vimrc ${HOME}/.vimrc

.PHONY: vundle-install
vundle-install: vimrc
ifeq (,$(wildcard ${HOME}/.vim/bundle/Vundle.vim))
	mkdir -p ${HOME}/.vim/bundle/Vundle.vim
	git clone ${VUNDLEREPO} ${HOME}/.vim/bundle/Vundle.vim
endif
	vim +PluginInstall +qall

.PHONY: coc-install
coc-install: vimrc vundle-install
	vim -c ":CocInstall coc-json coc-tsserver"
	rm -f ${HOME}/.vim/coc-settings.json
	ln -s ${ROOT_DIR}/dotfiles/coc-settings.json ${HOME}/.vim/coc-settings.json
