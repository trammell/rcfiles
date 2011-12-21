# define PAGER

if [ -z "$PAGER" ]; then
    export PAGER=`which less`
fi
if [ -z "$PAGER" ]; then
    export PAGER=`which more`
fi
