# if available, use ELC setup function
if [ $(type -t elc_setup_all | grep -q 'shell function') ]; then
    elc_setup_all
fi

