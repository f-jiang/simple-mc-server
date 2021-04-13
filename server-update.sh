#!/bin/bash

usage() { echo "Usage: $0 action" 1>&2; exit 1; }

create_backup() {
    "$REPO_PATH"/minecraft-backup/backup.sh -c \
                                            -i "$SERVER_PATH/$WORLD_DIR" \
                                            -o "$SERVER_PATH/$BACKUP_DIR" \
                                            -s mc-server:1 \
                                            -w tmux \
                                            -m 15
}

upload_backup_to_gdrive() {
    LOCAL_BACKUP_DIR="$SERVER_PATH"/"$BACKUP_DIR"
    LATEST_BACKUP="$(ls -t $LOCAL_BACKUP_DIR | head -1)"
    LATEST_BACKUP_LINK_PATH="$GDRIVE_PATH/$LATEST_BACKUP"
    ln -s "$LOCAL_BACKUP_DIR/$LATEST_BACKUP" "$LATEST_BACKUP_LINK_PATH"
    $DRIVE push -no-prompt "$LATEST_BACKUP_LINK_PATH" 
}

update_world_map() {
    $MC_OVERVIEWER --config="$REPO_PATH"/render.config
}

while test $# -gt 0; do
    case $1 in 
        create-backup)
            create_backup
            ;;
        upload-backup)
            upload_backup_to_gdrive
            ;;
        update-map)
            update_world_map
            ;;
        *)
            usage
            ;;
    esac
    shift
done

