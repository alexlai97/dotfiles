local awful = require("awful")

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
terminal = os.getenv("TERMINAL") or "termite"
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
-- suspend_command = "systemctl suspend; i3lock.sh"
suspend_command = "i3lock.sh && systemctl suspend"
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
icons = {}
icons.home = " "
-- icons.home = ""
icons.code = " "
-- icons.code = ""
icons.document = " "
icons.firefox = " "
icons.play = " "
icons.wechat = " "
icons.steam = " "
icons.leaf  = " "
icons.notebook = " "

tag_names = {
    icons.home,  -- 1
    icons.code,  -- 2 
    icons.document,  -- 3  
    icons.firefox, -- 4
    icons.play, -- 5
    icons.wechat, -- 6 
    icons.steam, -- 7
    icons.leaf, -- 8
    icons.notebook  -- 9
}
-- tag_names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile, -- master stack mode
    -- awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.fair, -- like grid
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}
