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
