#!/bin/dash
zenity --question --text="Are you sure to shutdown?" --default-cancel --icon-name "system-shutdown" && systemctl poweroff
