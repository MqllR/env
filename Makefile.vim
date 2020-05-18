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
