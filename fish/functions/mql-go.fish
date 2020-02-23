if not contains /usr/local/go/bin $PATH
  set PATH $PATH /usr/local/go/bin
end

if not contains $HOME/go/bin $PATH
  set PATH $PATH $HOME/go/bin
end
