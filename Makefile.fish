# vim:filetype=make

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: config
config:
	mkdir -p ${HOME}/.config/fish/functions
	mkdir -p ${HOME}/.config/fish/conf.d
	rm -f ${HOME}/.config/fish/conf.d/mql.fish
	ln -s ${ROOT_DIR}/fish/conf.d/mql.fish ${HOME}/.config/fish/conf.d/mql.fish

# https://github.com/jorgebucaran/fisher
.PHONY: fisher-install
fisher-install:
	curl https://git.io/fisher --create-dirs -sLo ${HOME}/.config/fish/functions/fisher.fish

# https://github.com/oh-my-fish/oh-my-fish/
.PHONY: omf-install
omf-install:
	curl -L https://get.oh-my.fish | fish
	fish -c 'omf install bobthefish'
