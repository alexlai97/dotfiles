local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ super_key }, 1, awful.mouse.client.move),
    awful.button({ super_key }, 3, awful.mouse.client.resize))

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
          "St",
          "Wpg",
        },

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          -- "AlarmWindow",  -- Thunderbird's calendar.
          -- "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, placement = awful.placement.centered }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    { rule = { name = "Openbox Logout" },
      properties = { fullscreen = true } },

    { rule = { class = "firefox" },
      properties = { tag = "" } },
    { rule = { class = "Zim" },
      properties = { screen = 1, tag = "" } },
    { rule = { class = "mpv" },
      properties = { tag = "" } },
    { rule_any = { class = { "VirtualBox", "jetbrains-studio", "jetbrains-idea-ce"} },
      properties = { tag = "" } },
    { rule_any = { class = { "Signal", "Mail" } },
      properties = { screen = 1, tag = "" } },
    { rule = { class = "Thunar" },
      properties = { screen = 1, tag = "" } },
    { rule_any = { class = "multimc", "Minecraft", "Terraria.bin.x86", "Steam" },
      properties = { screen = 1, tag = "" } },
    { rule = { class = "Plank" }, properties = { 
      border_width = 0,
      floating = true,
      sticky = true,
      ontop = true,
      focusable = false,
      below = false }
    }
} 
-- }}}
