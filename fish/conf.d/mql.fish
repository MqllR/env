set -gx EDITOR vim

for fun in $HOME/.config/fish/functions/mql-*.fish
  source $fun
end

function fish_greeting
    fish_logo
end
