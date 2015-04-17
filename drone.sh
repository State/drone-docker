#!/bin/bash

# A hacky way to discover docker hosts
if [[ ! -n ${DRONE_WORKER_NODES} ]] && [[ -n ${DOCKER_HOST_DNS} ]]; then
  workers=$(host -4 -t A ${DOCKER_HOST_DNS} | awk 'NR > 1 { printf(",") } /has address/ {printf("tcp://%s:2375", $4)}')
  export DRONE_WORKER_NODES=${workers}
fi

if [[ ${DRONE_REGISTRY_HOST} ]] && [[ ${DRONE_REGISTRY_AUTH} ]]; then
cat <<EOF > /root/.dockercfg
{
    "${DRONE_REGISTRY_HOST}": {
    "email": "",
    "auth": "${DRONE_REGISTRY_AUTH}"
  }
}
EOF
fi

# Allow to pass in drone options after --
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec /usr/local/bin/droned "$@"
fi

# If number of args is more than 1 and no drone options are given, start
# given command instead (i.e. /bin/bash)
exec "$@"

