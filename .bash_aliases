# vim: set filetype=sh :

# smart 'which' function: first argument is default, remaining
# arguments are searched for in $PATH
unset multiwhich
function multiwhich {
    local default=$1
    shift
    until [ -z "$1" ]; do  # loop over parameters
        w=$(which $1 2>/dev/null)
        if [ ! -z "$w" ]; then
            echo $w
            return
        fi
        shift
    done
    echo $default
    return
}

alias 'cd..'='cd ..'
alias h='history 100'
#alias git='git-achievements'
alias ll='ls -l --color=tty'
#alias ls='ls -G'
#alias lal='less +G -n /usr/local/apache/logs/access_log'
#alias lel='less +G -n /usr/local/apache/logs/error_log'
alias lel='less +G -n /var/log/apache2/error_log'
alias lal='less +G -n /var/log/apache2/access_log'

alias ls='ls --color=tty'
alias sl='ls --color=tty'


#alias git='git-achievements'
alias mysql-dev='mysql --defaults-group-suffix="-dev"'
alias mail=$(multiwhich /bin/mail mutt mail mailx)
alias newalias='vi ~/.aliases; source ~/.aliases'
alias perldoc='LANG=C perldoc'
alias sdr='screen -D -R'
alias svnid='svn propset svn:keywords "Id URL"'
alias ugm='UpdateGenericModules'
alias ugs='UpdateGeneric; UpdateStaging'
alias vi=$(multiwhich /bin/editor mvim vim vi pico)
alias vm='ssh vm'

unset multiwhich
