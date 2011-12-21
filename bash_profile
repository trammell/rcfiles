# .bash_profile

# function to manupulating the path
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

pathedit /usr/local/elc/bin after
pathedit /sw/bin
pathedit /opt/postgres/bin
pathedit /opt/local/bin
pathedit /opt/local/sbin
pathedit /usr/local/sbin
pathedit $HOME/bin
pathedit $HOME/work/github/git-achievements
pathedit $HOME/local/go/bin

unset pathedit

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
