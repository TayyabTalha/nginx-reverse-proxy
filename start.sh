#!/bin/bash

echo "=================================================="
echo "Checking ENV"

[[ -z "$UPSTREAM" ]] && echo "ENV UPSTREAM is EMPTY"

sed -i -e  's@UPSTREAM@'"$UPSTREAM"'@g' \
/etc/nginx/sites-available/default.conf 
# ----------------------------------------------------------------------
# Start supervisord
# ----------------------------------------------------------------------

exec /usr/bin/supervisord -n -c /etc/supervisord.conf
