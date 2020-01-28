# vim:filetype=make

GOVERSION=1.13.7
GOARCHIVE=go${GOVERSION}.linux-amd64.tar.gz
GOURL=https://dl.google.com/go/${GOARCHIVE}

.PHONY: go-install
go-install: go-clean fish
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
