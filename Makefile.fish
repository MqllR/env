# vim:filetype=make

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: fish-install
fish-install:
	sudo apt-get install fish
	mkdir -p ${HOME}/.config/fish/functions
	mkdir -p ${HOME}/.config/fish/conf.d
	rm -f ${HOME}/.config/fish/conf.d/mql.fish
	ln -s ${ROOT_DIR}/fish/conf.d/mql.fish ${HOME}/.config/fish/conf.d/mql.fish

# https://github.com/jorgebucaran/fisher
.PHONY: fisher-install
fisher-install: fish-install
	curl https://git.io/fisher --create-dirs -sLo ${HOME}/.config/fish/functions/fisher.fish

# https://github.com/oh-my-fish/oh-my-fish/
.PHONY: omf-install
omf-install: fish-install
	curl -L https://get.oh-my.fish | fish
