set -Ux GOPATH $HOME/go

for path in /usr/local/go/bin $GOPATH/bin
  if not contains path $PATH
    set PATH $PATH $path
  end
end
