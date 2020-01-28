# vim:filetype=make

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: tmux-install
tmux-install: tmuxconf fishaliases
	sudo apt-get install tmux

.PHONY: tmuxconf
tmuxconf:
	rm -f ${HOME}/.tmux.conf
	ln -s ${ROOT_DIR}/dotfiles/.tmux.conf ${HOME}/.tmux.conf

.PHONY: fishaliases
fishaliases:
	rm -f ${HOME}/.config/fish/functions/mql-tmux.fish
	ln -s ${ROOT_DIR}/fish/functions/mql-tmux.fish ${HOME}/.config/fish/functions/mql-tmux.fish
