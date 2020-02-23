set -gx GOROOT $HOME/go

for path in /usr/local/go/bin $GOROOT/bin
  if not contains path $PATH
    set PATH $PATH $path
  end
end
