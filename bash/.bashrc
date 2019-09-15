# vim: set filetype=sh :

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# source global bash script
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set up CLI completion, see
# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

complete -C aws_completer aws


# configure default editor (find 'vim', or, failing that, 'vi')

if [ -z "$EDITOR" ]; then
    MVIM=$(which mvim 2>/dev/null)
    if [ ! -z "$MVIM" ]; then
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



# set up miscellaneous environment variables

export CVSIGNORE="*.db *_usertest .*.swp"
export CVS_RSH=ssh
export FIGNORE="CVS:~:.o:.svn:.egg-info:.pyc:.old"
export GREP_OPTIONS="-I"
export LESS=-x4
export MYSQL_PS1="\u@\h:\d> "
export MAGENTO_TEST_AUTHOR=1
export APP_WAR_AUTHOR=1
# export PIP_USE_MIRRORS=1


# go environment
export GOROOT=~/local/go
export GOOS=darwin
export GOARCH=386


#
export HISTCONTROL=erasedups:ignoreboth
export HISTIGNORE='ls:history'
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
shopt -s histverify


# see also:
#   http://www.funtoo.org/Keychain
#   http://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
# Re-use ssh-agent and/or gpg-agent between logins

#eval $(/usr/bin/keychain --eval --quiet outsell_jtrammell outsell_jtrammell_git johntrammell)
eval $(/usr/bin/keychain --eval --quiet johntrammell)

#eval $(/usr/bin/keychain --quiet --eval $HOME/.ssh/outsell_jtrammell)
#ssh-add ~/.ssh/outsell_jtrammell_git
#ssh-add ~/.ssh/outsell_jtrammell
#ssh-add ~/.ssh/johntrammell

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# define PAGER

if [ -z "$PAGER" ]; then
    export PAGER=`which less`
fi
if [ -z "$PAGER" ]; then
    export PAGER=`which more`
fi


# set prompt
unset setup_prompt
function setup_prompt {
    local PROMPT="[\u@\h:\W \t \#]"
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






