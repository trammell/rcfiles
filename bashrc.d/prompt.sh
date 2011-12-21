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
