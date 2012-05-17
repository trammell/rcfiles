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

pathedit /usr/local/elc/bin after
#pathedit /sw/bin
#pathedit /opt/postgres-9.0/bin
pathedit $HOME/local/bin
#pathedit /opt/python-2.6/bin
#pathedit /opt/python-2.7/bin
pathedit $HOME/work/github/git-achievements
pathedit $HOME/local/go/bin
#pathedit $HOME/hc/builds/postgres/trunk/bin
#pathedit $HOME/hc/builds/python/trunk/python-2.4/bin
#pathedit $HOME/hc/builds/python/trunk/python-2.6/bin
pathedit $HOME/bin

unset pathedit

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
