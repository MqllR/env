## Bash history
HISTTIMEFORMAT="%d/%m/%y %T "
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000

## Environment variables
#########
export EDITOR=$(which vim)

# User specific aliases and functions
PS1="\$(cmd_return=\$?; if [[ \$cmd_return == 0 ]]; then echo \"\[\033[01;37m\]\$cmd_return\"; else echo \"\[\033[01;31m\]\$cmd_return\"; fi) \[\033[01;32m\]\u\[\033[01;37m\]@\[\033[01;34m\]\h\[\033[01;35m\] \w \[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

## Use Vi binding
set -o vi

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

## Load additional scripts
############
if [ -d ${HOME}/.bash_completion.d ]; then
    shopt -s nullglob
    for f in ${HOME}/.bash_completion.d/*; do
      source $f
    done

    shopt -u nullglob
fi

# Load specific scripts like creds ;)
if [ -d ${HOME}/.bashrc.d ]; then
    shopt -s nullglob
    for f in ${HOME}/.bashrc.d/*; do
      source $f
    done

    shopt -u nullglob
fi

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
alias g="git"
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

complete -F _complete_alias g
complete -F _complete_alias ga
complete -F _complete_alias gr
complete -F _complete_alias gre
complete -F _complete_alias gs
complete -F _complete_alias gsh
complete -F _complete_alias gc
complete -F _complete_alias gco
complete -F _complete_alias gd
complete -F _complete_alias gl
complete -F _complete_alias gf
complete -F _complete_alias gb
complete -F _complete_alias gps
complete -F _complete_alias gpu
complete -F _complete_alias ggrep

# Hub
alias openpr="hub pull-request --browse"

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgyml='kubectl get -oyaml'
alias kgl='kubectl get -l'
alias kgpol='kubectl get po -l'
alias kgporun='kubectl get po --field-selector=status.phase=Running'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
alias ka='kubectl apply'
alias krm='kubectl delete'
alias kd='kubectl describe'
alias ke='kubectl exec -it'
alias kl='kubectl logs'

complete -F _complete_alias k
complete -F _complete_alias kg
complete -F _complete_alias kgyml
complete -F _complete_alias kgl
complete -F _complete_alias kgpol
complete -F _complete_alias kgporun
complete -F _complete_alias kge
complete -F _complete_alias ka
complete -F _complete_alias krm
complete -F _complete_alias kd
complete -F _complete_alias ke
complete -F _complete_alias kl
