#!/bin/bash

# see also:
#   http://www.funtoo.org/Keychain
#   http://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
# Re-use ssh-agent and/or gpg-agent between logins

eval $(/usr/bin/keychain --eval --quiet outsell_jtrammell outsell_jtrammell_git johntrammell)

#eval $(/usr/bin/keychain --quiet --eval $HOME/.ssh/outsell_jtrammell)
#ssh-add ~/.ssh/outsell_jtrammell_git
#ssh-add ~/.ssh/outsell_jtrammell
#ssh-add ~/.ssh/johntrammell

