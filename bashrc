# vim: set filetype=sh :

# source global bash script
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# source local bash scripts
if [ -d ${HOME}/.bashrc.d ]; then
  for i in ${HOME}/.bashrc.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
