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
	fish -c 'fisher install jorgebucaran/nvm.fish'

# https://github.com/oh-my-fish/oh-my-fish/
.PHONY: omf-install
omf-install:
	mkdir -p ${HOME}/.local/share/fonts
	mkdir -p ${HOME}/.config/fontconfig/conf.d
	curl -L "https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf" -o "${HOME}/.local/share/fonts/PowerlineSymbols.otf"
	curl -L "https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf" -o "${HOME}/.config/fontconfig/conf.d/10-powerline-symbols.conf"
	fc-cache -vf ${HOME}/.local/share/fonts/
	curl -L "https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install" | fish
	fish -c 'omf install bobthefish'
