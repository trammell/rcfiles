# .bash_profile

# function for manupulating the path
unset pathedit
function pathedit () {
    if [ -d $1 ]; then
        if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
    export PATH
}

pathedit $HOME/local/bin
pathedit $HOME/bin

unset pathedit

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
