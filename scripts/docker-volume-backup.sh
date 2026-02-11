#!/usr/bin/env bash
set -euo pipefail

BACKUP_ROOT="/data/backup/dockervolumes"
TIMESTAMP="$(date +%F)"
DEST="$BACKUP_ROOT/$TIMESTAMP"

mkdir -p "$DEST"

echo "Backup target is $DEST"
docker volume ls -q | while read -r VOLUME; do
  echo "Backing up $VOLUME..."
  SRC="/var/lib/docker/volumes/$VOLUME/_data"
  TARGET="$DEST/$VOLUME"

  if [ -d "$SRC" ]; then
    mkdir -p "$TARGET"
    rsync -a --delete "$SRC/" "$TARGET/"
  fi
done

# Keep only last 7 backups
ls -1dt "$BACKUP_ROOT"/* | tail -n +8 | xargs -r rm -rf