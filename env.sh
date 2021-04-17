export SERVER_PATH=foo
export GDRIVE_PATH=bar
export REPO_PATH=baz
export PORT=qux

export WORLD_DIR=quux
export BACKUP_DIR=quuz
export MAP_DIR=garply

export CONTAINER_NAME=grault

export PYTHON=python3
export DRIVE=drive
export MC_OVERVIEWER=corge

cd "$REPO_PATH"
for file in mc-server.yml render.config; do
    (envsubst < $file) > tmp && mv tmp $file
done

