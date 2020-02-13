set -gx EDITOR vim

for fun in $HOME/.config/fish/functions/mql-*.fish
  source $fun
end

# Theme bobthefish
set -g theme_display_k8s_context yes
set -g theme_display_virtualenv no
set -g theme_display_ruby no
set -g theme_display_nvm no
set -g theme_color_scheme solarized
