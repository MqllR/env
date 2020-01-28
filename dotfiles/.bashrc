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
alias g='git'

complete -F _complete_alias g

# Hub
alias openpr="hub pull-request --browse"

# Kubernetes
get_running_pods_name() {
  kubectl get pods --field-selector=status.phase=Running -o=jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'
}

# kshell regex [command]
kshell() {
  pod=$(get_running_pods_name | grep -E $1 | head -1)
  cmd=sh
  if [ ! -z $2 ] ; then
    cmd=$2
  fi
  kubectl exec -it $pod -- $cmd
}

# klogs regex
klogs() {
  pod=$(get_running_pods_name | grep -E $1 | head -1)
  kubectl logs -f $pod
}

# kpods [regex]
kpods() {
  if [ $# -gt 0 ]; then
    kubectl get pods | grep -E $1
  else
    kubectl get pods
  fi
}

alias k='kubectl'
alias kg='kubectl get'
alias kgyml='kubectl get -oyaml'
alias kgwide='kubectl get -owide'
alias kgpol='kubectl get po -l'
alias kgporun='kubectl get po --field-selector=status.phase=Running'
alias kgponotrun='kubectl get po --field-selector=status.phase!=Running'
alias kgpofail='kubectl get po --field-selector=status.phase=Failed'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kgewarn='kubectl get events --sort-by=.metadata.creationTimestamp --field-selector type=Warning'
alias kgenotnorm='kubectl get events --sort-by=.metadata.creationTimestamp --field-selector type!=Normal'
alias ka='kubectl apply'
alias krm='kubectl delete'
alias kd='kubectl describe'
alias ke='kubectl exec -it'
alias kl='kubectl logs'

complete -F _complete_alias k
complete -F _complete_alias kg
complete -F _complete_alias kgyml
complete -F _complete_alias kgwide
complete -F _complete_alias kgl
complete -F _complete_alias kgpol
complete -F _complete_alias kgporun
complete -F _complete_alias kgpofail
complete -F _complete_alias kge
complete -F _complete_alias kgewarn
complete -F _complete_alias kgenotnorm
complete -F _complete_alias ka
complete -F _complete_alias krm
complete -F _complete_alias kd
complete -F _complete_alias ke
complete -F _complete_alias kl
