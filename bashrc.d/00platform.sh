export SYSTEM_LOCATION='hc'
export SYSTEM_PLATFORM='imac'

# import local platform overrides
if [ -f ~/.platform.sh ]; then
    . ~/.platform.sh
fi
