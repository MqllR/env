## Functions
##########

# Docker
docktag() {
    if [ $# -ne 1 ] ; then
        echo "Syntax: docktag docker_image"
        exit 1
    fi

    curl -s 'https://registry.hub.docker.com/v2/repositories/$1/tags/' | jq '."results"[]["name"]'
}

git() {
  umask 0022; command git "$@"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# User specific aliases and functions
PS1="\$(cmd_return=\$?; if [[ \$cmd_return == 0 ]]; then echo \"\[\033[01;37m\]\$cmd_return\"; else echo \"\[\033[01;31m\]\$cmd_return\"; fi) \[\033[01;32m\]\u\[\033[01;37m\]@\[\033[01;34m\]\h\[\033[01;35m\] \w \[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

## ALIAS
##########
alias rgrep="grep -r"

# Tmux
alias tmc="tmux new-session -s mql"
alias tma="tmux attach -t mql"
alias tmk="tmux kill-session -t mql"

# Git
alias ga="git add"
alias gr="git rm"
alias gs="git status"
alias gc="git commit -m"
alias gd='git diff'
alias gl='git log'
alias gf='git fetch'
alias gb='git branch'
alias gps="git push"
alias gpu="git pull"
