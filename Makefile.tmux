# vim:filetype=make

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: tmux-install
tmux-install: tmuxconf
	sudo apt-get install tmux

.PHONY: tmuxconf
tmuxconf:
	rm -f ${HOME}/.tmux.conf
	ln -s ${ROOT_DIR}/dotfiles/.tmux.conf ${HOME}/.tmux.conf
