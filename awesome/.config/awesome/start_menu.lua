local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- {{{ Start Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}

mylogoutmenu = {
  { "logout", function() awesome.quit() end},
  { "restart", function() awful.spawn(reboot_command) end},
  { "shutdown", function() awful.spawn(shutdown_command) end},
  { "suspend", function() awful.spawn.easy_async_with_shell(suspend_command) end},
  { "lock", function() awful.spawn(lockscreen_command) end}
}

myservicemenu = {
  { "redshift", function() awful.spawn.easy_async_with_shell(redshift_restart_command) end },
  -- { "mpd", function() awful.spawn.easy_async_with_shell(mpd_restart_command) end },
  -- { "emerge-sync", function() awful.spawn.easy_async_with_shell(emergesync_command) end }, -- cannot run sudo 
  -- { "mailsync", function() awful.spawn.easy_async_with_shell(mailsync_command) end },
  -- { "sxhkd", function() awful.spawn.easy_async_with_shell(sxhkd_restart_command) end }
}

mymainmenu = awful.menu({ items = { 
                                    { "menu", mylogoutmenu, arch_icon },
                                    { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "service", myservicemenu },
                                    { "open terminal", terminal, terminal_icon }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = arch_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
