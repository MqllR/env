# vim:filetype=make

GOVERSION=1.13.6
GOARCHIVE=go${GOVERSION}.linux-amd64.tar.gz
GOURL=https://dl.google.com/go/${GOARCHIVE}

.PHONY: go-install
go-install: go-clean
	curl -O ${GOURL}
	sudo tar -C /usr/local -xzf ${GOARCHIVE}
	rm -f ${GOARCHIVE}

.PHONY: go-clean
go-clean:
	sudo rm -rf /usr/local/go
