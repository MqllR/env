## Bash history
HISTTIMEFORMAT="%d/%m/%y %T "
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000

## Environment variables
#########
export EDITOR=$(which vim)

## Functions
##########

# Docker
docktag() {
    if [ $# -ne 1 ] ; then
        echo "Syntax: docktag docker_image"
        exit 1
    fi

    curl -s "https://registry.hub.docker.com/v2/repositories/$1/tags/" | jq '.results[].name'
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
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias rgrep="grep -r"

# Tmux
alias tmc="tmux new-session -s mql"
alias tma="tmux attach -t mql"
alias tmk="tmux kill-session -t mql"

# Git
alias ga="git add"
alias gr="git rm"
alias gre="git reset"
alias gs="git status"
alias gsh="git show"
alias gc="git commit -m"
alias gco="git checkout"
alias gd='git diff'
alias gl='git log'
alias gf='git fetch'
alias gb='git branch'
alias gps="git push"
alias gpu="git pull"
alias ggrep="git grep"

# Git auto-completion
__git_complete gco _git_checkout
__git_complete gps _git_push
__git_complete gpu _git_pull
__git_complete gb _git_branch
__git_complete ga _git_add
__git_complete gr _git_rm
__git_complete gf _git_fetch
__git_complete gd _git_diff

# Kubernetes
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl exec -it'
alias kl='kubectl logs'

# Load specific scripts like creds ;)
if [ -d ${HOME}/.bashrc.d ]; then
    shopt -s nullglob
    for f in ${HOME}/.bashrc.d/*; do
      source $f
    done

    shopt -u nullglob
fi
