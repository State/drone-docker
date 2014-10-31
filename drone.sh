#!/bin/bash

# Allow to pass in drone options after --
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec /usr/local/bin/droned "$@"
fi

# If number of args is more than 1 and no drone options are given, start
# given command instead (i.e. /bin/bash)
exec "$@"

