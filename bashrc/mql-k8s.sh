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

# kpods [regex]
kpods() {
  if [ $# -gt 0 ]; then
    kubectl get pods | grep -E $1
  else
    kubectl get pods
  fi
}

alias k='kubectl'
alias kgyml='kubectl get -oyaml'
alias kgwide='kubectl get -owide'
alias kgpol='kubectl get po -l'
alias kgporun='kubectl get po --field-selector=status.phase=Running'
alias kgponotrun='kubectl get po --field-selector=status.phase!=Running'
alias kgpofail='kubectl get po --field-selector=status.phase=Failed'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kgewarn='kubectl get events --sort-by=.metadata.creationTimestamp --field-selector type=Warning'
alias kgenotnorm='kubectl get events --sort-by=.metadata.creationTimestamp --field-selector type!=Normal'
alias ke='kubectl exec -it'

complete -F _complete_alias k
complete -F _complete_alias kgyml
complete -F _complete_alias kgwide
complete -F _complete_alias kgl
complete -F _complete_alias kgpol
complete -F _complete_alias kgporun
complete -F _complete_alias kgpofail
complete -F _complete_alias kge
complete -F _complete_alias kgewarn
complete -F _complete_alias kgenotnorm
complete -F _complete_alias ke
