function k --wraps=kubectl ; kubectl $argv ; end

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
alias kg='kubectl get'
alias kd='kubectl describe'

function get_running_pods_name
  kubectl get pods --field-selector=status.phase=Running -o=jsonpath='{range .items[*]}{@.metadata.name}{"\n"}{end}'
end

if not contains $HOME/.krew/bin/ $PATH
  set PATH $PATH $HOME/.krew/bin/
end

## kshell regex [command]
function kshell
  set -l pod (get_running_pods_name | grep -E $argv[1] | head -1)
  set -l cmd sh

  if test $argv[2]
    set cmd $argv[2]
  end

  if test -z $pod
    echo "No pods match"
    return 1
  end

  kubectl exec -it $pod -- $cmd
end

## kpods [regex]
function kpods
  if test $argv[1]
    kubectl get pods | grep -E $argv[1]
  else
    kubectl get pods
  end
end
