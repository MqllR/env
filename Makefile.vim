# vim:filetype=make

VIMVERSION=8.2.0148
VIMARCHIVE=v${VIMVERSION}.tar.gz
VIMURL=https://github.com/vim/vim/archive/${VIMARCHIVE}

VUNDLEREPO=https://github.com/VundleVim/Vundle.vim.git

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: vim-install
vim-install: vim-uninstall vimrc
	cd /tmp/vim-${VIMVERSION}; ./configure; make install
	$(MAKE) -f Makefile.vim vundle-install

.PHONY: vim-uninstall
vim-uninstall: vim-download
	cd /tmp/vim-${VIMVERSION} ; make uninstall

.PHONY: vim-download
vim-download:
ifeq (,$(wildcard /tmp/${VIMARCHIVE}))
	cd /tmp ; curl -LO ${VIMURL}
	tar xzf /tmp/${VIMARCHIVE} -C /tmp
endif

.PHONY: vimrc
vimrc:
	rm -f ${HOME}/.vimrc
	ln -s ${ROOT_DIR}/dotfiles/.vimrc ${HOME}/.vimrc

.PHONY: vundle-install
vundle-install: vimrc
ifeq (,$(wildcard ${HOME}/.vim/bundle/Vundle.vim))
	mkdir ${HOME}/.vim/bundle/Vundle.vim
	git clone ${VUNDLEREPO} ${HOME}/.vim/bundle/Vundle.vim
endif
	vim +PluginInstall +qall
