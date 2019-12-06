#!/bin/dash
zenity --question --text="Are you sure to reboot?" --default-cancel --icon-name "system-reboot" && systemctl reboot
