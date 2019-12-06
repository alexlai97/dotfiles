-- {{{ Variable definitions
-- directories
home_path = os.getenv("HOME") .. '/'
bin_path = home_path .. '.local/bin/'
scripts_path = home_path .. '.scripts/'
cache_path = home_path .. '.cache/'
wallpaper_path = home_path .. "Pictures/Wallpaper/"
config_path = home_path .. '.config/'
icon_path = home_path .. '.local/share/icons/'


-- termial and editor
terminal = "/usr/bin/termite"
terminal_cmd = terminal .. " -e "
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal_cmd .. editor

-- icons
-- gentoo_icon = my_icon_path .. "gentoo/gentoo.png"
arch_icon = icon_path .. "hicolor/16x16/apps/example-archlinux_icon.png"
terminal_icon = "/usr/share/icons/Adwaita/16x16/legacy/utilities-terminal.png"

-- commands
-- dbus_consolekit_prefix = "dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager."
-- suspend_command = dbus_consolekit_prefix .. "Suspend  boolean:true"
-- shutdown_command = dbus_consolekit_prefix .. "Stop"
-- reboot_command = dbus_consolekit_prefix .. "Restart"
suspend_command = "systemctl suspend"
shutdown_command = "myshutdown.sh"
reboot_command = "myreboot.sh"
lockscreen_command = "i3lock.sh"
-- sxhkd_restart_command = "pkill sxhkd; sxhkd &; notify-send 'sxhkd' 'sxhkd restarted'"
redshift_restart_command = "pkill redshift; /usr/bin/redshift"
mpd_restart_command = "pkill mpd; mpd &; notify-send 'mpd' 'mpd restarted'"

-- mailsync_command = "mailsync; 'Mailsync' 'mailsync completed'"
-- emergesync_command = "sudo emerge --sync; notify-send 'emerge' 'emerge --sync completed'; eix-update; notify-send 'eix' 'eix-update completed'"

-- Default modkey.
super_key = "Mod4"
alt_key   = "Mod1"
shift_key   = "Shift"

-- Each screen has its own tag table.
tag_names = { "", "", "", "", "", "", "", "", "" }
-- }}}
