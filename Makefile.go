# vim:filetype=make

GOVERSION=1.14.4
GOARCHIVE=go${GOVERSION}.linux-amd64.tar.gz
GOURL=https://dl.google.com/go/${GOARCHIVE}

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: install
install: go-clean
	curl -O ${GOURL}
	sudo tar -C /usr/local -xzf ${GOARCHIVE}
	rm -f ${GOARCHIVE}

.PHONY: go-clean
go-clean:
	sudo rm -rf /usr/local/go

.PHONY: fish
fish:
	rm -f ${HOME}/.config/fish/functions/mql-go.fish
	ln -s ${ROOT_DIR}/fish/functions/mql-go.fish ${HOME}/.config/fish/functions/mql-go.fish

.PHONY: bash
bash:
	rm -f ${HOME}/.bashrc.d/mql-go.sh
	ln -s ${ROOT_DIR}/bashrc/mql-go.sh ${HOME}/.bashrc.d/mql-go.sh
