# vim:filetype=make

# https://github.com/oh-my-fish/oh-my-fish/
.PHONY: bashrc
bashrc:
	mkdir ${HOME}/.bashrc.d ${HOME}/.bash_completion.d
	curl -L https://raw.githubusercontent.com/bcmarinacci/powerline-shell/master/powerline-shell.bash -o ${HOME}/.bashrc.d/powerline-shell.bash
	curl -L https://raw.githubusercontent.com/cykerway/complete-alias/master/bash_completion.sh -o ${HOME}/.bash_completion/bash_completion.sh
	rm -f ${HOME}/.bashrc
	ln -s ${ROOT_DIR}/dotfiles/.bashrc ${HOME}/.bashrc
