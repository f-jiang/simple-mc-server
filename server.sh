#!/bin/bash

usage() { echo "Usage: $0 action" 1>&2; exit 1; }

start_server() {
    if [ -z "$(docker ps -a | grep -w $CONTAINER_NAME)" ]; then
        echo creating new server container
        docker run -d \
                   -it \
                   -p $PORT:$PORT \
                   -v "$SERVER_PATH":/data \
                   --env-file "$REPO_PATH"/mc-env.list \
                   --restart on-failure \
                   --name "$CONTAINER_NAME" \
                   "itzg/minecraft-server:multiarch"
    else
        echo starting pre-existing server container
        docker start "$CONTAINER_NAME"
    fi
}

stop_server() { docker stop "$CONTAINER_NAME"; }

case $1 in
    start)
        start_server
        ;;
    stop)
        stop_server
        ;;
    *)
        usage
        ;;
esac

