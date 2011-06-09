# $Id: bashrc,v 1.28 2007/10/04 19:49:55 johnt Exp $

# Source global definitions

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# if available, use ELC setup function
#if [ $(type elc_setup_all | grep -q 'shell fuction') ]; then
#    elc_setup_all
#fi

# configure default editor (find 'vim', or, failing that, 'vi')
# FIXME: would be nice to make a function for doing this...

if [ -z "$EDITOR" ]; then
    MVIM=`which mvim`
    if [ ! -z "$MVIM" ]; then
        echo "setting editor to MacVim"
        EDITOR="$MVIM -f"
        export EDITOR
    fi
fi
if [ -z "$EDITOR" ]; then
    export EDITOR=`which vim`
fi
if [ -z "$EDITOR" ]; then
    export EDITOR=`which vi`
fi
if [ -z "$EDITOR" ]; then
    export EDITOR='/bin/editor'
fi

if [ -z "$PAGER" ]; then
    export PAGER=`which less`
fi
if [ -z "$PAGER" ]; then
    export PAGER=`which more`
fi

export LESS=-x4
export MYSQL_PS1="\u@\h:\d> "
export CVSIGNORE="*.db *_usertest"
export CVSROOT=johnt@diamond:/usr/local/cvs/repo
export CVS_RSH=ssh
export PATH="${PATH}:${HOME}/bin"
export FIGNORE="CVS:~:.o:.svn:.egg-info:.pyc:.old"
export SVNREPO="svn://silver/plone-repository"
export GREP_OPTIONS="-I"
export MAGENTO_TEST_AUTHOR=1
export APP_WAR_AUTHOR=1
export LC_ALL="en_US.utf8"
export LANG="en_US.UTF-8"

# load aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi