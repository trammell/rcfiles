# .bash_profile

# utility function used below for manupulating the path
unset pathedit
function pathedit () {
    if [ -d $1 ]; then
        if ! echo $PATH | /usr/bin/egrep -q "(^|:)$1($|:)" ; then
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
    export PATH
}

pathedit /usr/local/elc/bin after
pathedit /sw/bin
pathedit /opt/postgres/bin
pathedit /opt/local/bin
pathedit /opt/local/sbin
pathedit /usr/local/sbin
pathedit $HOME/bin
pathedit $HOME/work/github/git-achievements

unset pathedit

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set prompt
unset setup_prompt
function setup_prompt {
    local PROMPT="[ \u@\h:\W \# ]"
    local NO_COLOR="\[\e[0m\]"
    local RED="\[\e[1;31m\]"
    local GREEN="\[\e[1;32m\]"
    local YELLOW="\[\e[1;33m\]"
    local BLUE="\[\e[1;34m\]"
    local PURPLE="\[\e[1;35m\]"
    local CYAN="\[\e[1;36m\]"
    local WHITE="\[\e[1;37m\]"
    export PS1="${YELLOW}${PROMPT}${NO_COLOR} "
}
setup_prompt
unset setup_prompt

