# if available, use ELC setup function
if [ $(type elc_setup_all | grep -q 'shell fuction') ]; then
    elc_setup_all
fi

