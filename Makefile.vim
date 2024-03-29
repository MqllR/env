# vim:filetype=make

VUNDLEREPO=https://github.com/VundleVim/Vundle.vim.git

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: vimrc
vimrc:
	rm -f ${HOME}/.vimrc
	ln -s ${ROOT_DIR}/dotfiles/.vimrc ${HOME}/.vimrc

.PHONY: vundle-install
vundle-install:
ifeq (,$(wildcard ${HOME}/.vim/bundle/Vundle.vim))
	mkdir -p ${HOME}/.vim/bundle/Vundle.vim
	git clone ${VUNDLEREPO} ${HOME}/.vim/bundle/Vundle.vim
endif
	vim +PluginInstall +qall

.PHONY: coc-install
coc-install:
	vim -c ":CocInstall coc-json coc-yaml coc-tsserver coc-eslint coc-prettier coc-solargraph"
	rm -f ${HOME}/.vim/coc-settings.json
	ln -s ${ROOT_DIR}/vimrc/coc-settings.json ${HOME}/.vim/coc-settings.json
