#!/bin/bash

BACKUP_DIR1="/mnt/largefs/Backups/"
BACKUP_DIR2="/run/media/alex/linux-backup/backups/"
secret_backup="secret-backups"
normal_backup="normal-backups"
root_backup="root-backups"

normal_file_list="~/Documents/ ~/Music/ ~/Nextcloud ~/Pictures ~/Videos ~/Projects 
--exclude ~/Projects/notmyrepos/
--exclude ~/Projects/myrepos/
--exclude ~/Projects/Gide/
--exclude ~/Projects/shared_repos/
"

backup() {
    target_dir=$1
    backup_name=$2
    backup_files=$3
    whether_sudo=$4
    if [ ! -d "$target_dir" ]; then
        echo "!!! directory not exist: $target_dir" 
        exit 1;
    fi

    # FIXME: remove echo 
    echo $whether_sudo borg create --stats --progress $target_dir::$backup_name-{user}-{now} $backup_files
}


#echo "--------backup to $BACKUP_DIR1 --------"
#backup "$BACKUP_DIR1$secret_backup" "gnupg" "/home/alex/.gnupg"
#backup "$BACKUP_DIR1$normal_backup" "home-some-dirs" "$normal_file_list"
#backup "$BACKUP_DIR1$root_backup" "etc" "/etc" "sudo"

echo "--------backup to $BACKUP_DIR2 --------"
backup "$BACKUP_DIR2$secret_backup" "gnupg-ssh-git" "~/.gnupg ~/.ssh ~/.config/git/"
backup "$BACKUP_DIR2$normal_backup" "home-common-dirs" "$normal_file_list"
backup "$BACKUP_DIR2$root_backup" "etc" "/etc" "sudo"
