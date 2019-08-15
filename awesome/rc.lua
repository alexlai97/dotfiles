-- {{{ Load libraries
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.autofocus")
require("keybindings")
-- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")
-- }}} 

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- directories
home_path = os.getenv("HOME") .. '/'
bin_path = home_path .. '.local/bin/'
scripts_path = home_path .. '.scripts/'
cache_path = home_path .. '.cache/'
wallpaper_path = home_path .. "Pictures/Wallpaper/"
config_path = home_path .. '.config/'
my_icon_path = home_path .. '.icons/'

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(config_path .. "awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "/usr/local/bin/alacritty"
terminal_cmd = terminal .. " -e "
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal_cmd .. editor

-- icons
gentoo_icon = my_icon_path .. "gentoo/gentoo.png"
terminal_icon = "/usr/share/icons/Adwaita/16x16/apps/utilities-terminal.png"

-- commands
dbus_consolekit_prefix = "dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager."
suspend_command = dbus_consolekit_prefix .. "Suspend  boolean:true"
shutdown_command = dbus_consolekit_prefix .. "Stop"
reboot_command = dbus_consolekit_prefix .. "Restart"
lockscreen_command = "slock"
sxhkd_restart_command = "pkill sxhkd; sxhkd &; notify-send 'sxhkd' 'sxhkd restarted'"
redshift_restart_command = "pkill redshift; /usr/bin/redshift"
mpd_restart_command = "pkill mpd; mpd &; notify-send 'mpd' 'mpd restarted'"

mailsync_command = "mailsync; 'Mailsync' 'mailsync completed'"
emergesync_command = "sudo emerge --sync; notify-send 'emerge' 'emerge --sync completed'; eix-update; notify-send 'eix' 'eix-update completed'"

-- Default modkey.
super_key = "Mod4"
alt_key   = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
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

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{ Menu
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
  { "suspend", function() awful.spawn(suspend_command) end},
  { "lock", function() awful.spawn(lockscreen_command) end}
}

myservicemenu = {
  { "redshift", function() awful.spawn.easy_async_with_shell(redshift_restart_command) end },
  { "mpd", function() awful.spawn.easy_async_with_shell(mpd_restart_command) end },
  -- { "emerge-sync", function() awful.spawn.easy_async_with_shell(emergesync_command) end }, -- cannot run sudo 
  { "mailsync", function() awful.spawn.easy_async_with_shell(mailsync_command) end },
  { "sxhkd", function() awful.spawn.easy_async_with_shell(sxhkd_restart_command) end }
}

mymainmenu = awful.menu({ items = { 
                                    { "menu", mylogoutmenu, gentoo_icon },
                                    { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "service", myservicemenu },
                                    { "open terminal", terminal, terminal_icon }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = gentoo_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- Helper function to read all content in a file
local function read_line_from_a_file(file)
  local f = assert(io.open(file))
  local t = f:read("*all")
  f:close()
  return t
end

-- mymood
mymood = wibox.widget.textbox(read_line_from_a_file(cache_path .. 'mymood/mymood.txt'))
mymood:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mymood choose") end) ,
  awful.button({ }, 3, function() awful.spawn("mymood ask") end)
))

-- myweather
myweather = wibox.widget.textbox(read_line_from_a_file(cache_path .. 'weather/current_weather_oneline.txt'))
myweather:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("weather show") end) ,
  awful.button({ }, 3, function() awful.spawn("weather get") end)
))


-- Create a textclock widget
-- mytextclock = wibox.widget.textclock( {format = " %a %b.%d  %T", refresh = 1})
mytextclock = wibox.widget.textclock( " %a %b.%d  %T", 1)
month_calendar = awful.widget.calendar_popup.month({position = "tr"})
mytextclock:buttons(gears.table.join(
  awful.button({ }, 1, function() month_calendar:toggle() end) ,
  -- awful.button({ }, 1, function() awful.spawn("zsh_rofi") end) ,
  awful.button({ }, 2, function() awful.spawn("oblogout") end) ,
  awful.button({ }, 3, function() awful.spawn("rightclickmenu") end)
))

-- battery widget
mybattery = awful.widget.watch(scripts_path .. "mybattery", 2)
mybattery:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mybattery update") end) ,
  awful.button({ }, 3, function() awful.spawn("mybattery update") end) 
))

-- mem widget
mymem = awful.widget.watch(scripts_path .. "mymem", 4)
mymem:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mymem update") end) ,
  awful.button({ }, 3, function() awful.spawn("mymem update") end) 
))

-- cpu widget
mycpu = awful.widget.watch(scripts_path .. "mycpu", 2)
mycpu:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mycpu update") end) ,
  awful.button({ }, 3, function() awful.spawn("mycpu update") end) 
))

-- dayornight widget
mydayornight = awful.widget.watch(scripts_path .. "dayornight", 3600)
mydayornight:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("dayornight update") end) ,
  awful.button({ }, 3, function() awful.spawn("dayornight update") end) 
))

-- wifi widget
mywifi = awful.widget.watch(scripts_path .. "mywifi", 4)
mywifi:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mywifi update") end) ,
  awful.button({ }, 3, function() awful.spawn("mywifi update") end) 
))

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ super_key }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ super_key }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    local names = { "", "", "", "", "", "", "", "", "" }
    local l = awful.layout.suit  -- Just to save some typing: use an alias.
    local layouts = { l.floating, l.floating, l.floating, l.floating, l.floating, l.floating, l.floating, l.floating, l.floating }
    awful.tag(names, s, layouts)
    -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            wibox.widget.textbox(' '),
            mywifi,
            wibox.widget.textbox(' '),
            mycpu,
            wibox.widget.textbox(' '),
            mymem,
            wibox.widget.textbox(' '),
            mybattery,
            wibox.widget.textbox(' | '),
            myweather,
            wibox.widget.textbox(' '),
            mytextclock,
            wibox.widget.textbox(' '),
            mydayornight,
            wibox.widget.textbox(' '),
            mymood,
            wibox.widget.textbox(' '),
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- Set keys
root.keys(globalkeys)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ super_key }, 1, awful.mouse.client.move),
    awful.button({ super_key }, 3, awful.mouse.client.resize))

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 1, function () mymainmenu:toggle() end),
    awful.button({ }, 2, function () awful.spawn("sxiv " .. wallpaper_path) end),
    awful.button({ }, 3, function () awful.spawn("rightclickmenu") end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          -- "DTA",  -- Firefox addon DownThemAll.
          -- "copyq",  -- Includes session name in class.
        },
        class = {
          "Sxiv",
          "st"
        },

        name = {
          "Event Tester",  -- xev.
          "Openbox Logout",
        },
        role = {
          -- "AlarmWindow",  -- Thunderbird's calendar.
          -- "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    { rule = { class = "Firefox" },
      properties = { tag = "" } },
    { rule = { class = "Zim" },
      properties = { screen = 1, tag = "" } },
    { rule = { class = "mpv" },
      properties = { tag = "" } },
    { rule_any = { class = { "VirtualBox", "jetbrains-studio"} },
      properties = { tag = "" } },
    { rule = { class = "Signal" },
      properties = { screen = 1, tag = "" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
    awful.titlebar.hide(c)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
