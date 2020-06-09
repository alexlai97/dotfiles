#!/bin/bash

BACKUP_DIR1="/mnt/largefs/Backups/"
BACKUP_DIR2="/run/media/alex/backup/backups/"
secret_backup="secret-backups"
normal_backup="normal-backups"
root_backup="root-backups"

normal_file_list="~/Documents/ ~/Music/ ~/Nextcloud ~/Pictures ~/Videos"

backup() {
    target_dir=$1
    backup_name=$2
    backup_files=$3
    if [ ! -d "$target_dir" ]; then
        echo no $target_dir directory exists
        exit 1;
    fi

    # FIXME: remove echo 
    echo borg create --stats --progress $target_dir::$backup_name-{user}-{now} $backup_files
}

backup "$BACKUP_DIR1$secret_backup" "gnupg" "/home/alex/.gnupg"
backup "$BACKUP_DIR2$secret_backup" "gnupg" "/home/alex/.gnupg"
backup "$BACKUP_DIR1$normal_backup" "home-some-dirs" "$normal_file_list"
backup "$BACKUP_DIR2$normal_backup" "home-some-dirs" "$normal_file_list"
backup "$BACKUP_DIR1$root_backup" "etc" "/etc"
backup "$BACKUP_DIR2$root_backup" "etc" "/etc"
