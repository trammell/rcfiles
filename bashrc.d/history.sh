export HISTCONTROL=erasedups:ignoreboth
export HISTIGNORE='ls:history'
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
shopt -s histverify
