--{{{ imports
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- local variables = require("variables") TODO change to local
require("variables")
--}}}

--{{{ Global keys 
globalkeys = gears.table.join(
    -- {{{ awesome group 
    -- TODO press window key for 1 s then spawn
    awful.key({ super_key,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ super_key, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ super_key, "Shift"   }, "Escape", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    --[[
    awful.key({ super_key,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    --]]
    --}}}

    --{{{ client group
    awful.key({ super_key,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ super_key,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ super_key,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    
    awful.key({ alt_key           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus back", group = "client"}),

    awful.key({ super_key, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    awful.key({ super_key },            "w",     function () awful.spawn("rofi -show window") end,
              {description = "rofi switch program", group = "client"}),
    --}}}

    -- {{{ function key (PowerOff, Volume, Media, Brightness, Screenshot, LED)
      -- PowerOff show oblogout
      awful.key({}, "XF86PowerOff", function () awful.spawn("oblogout") end,
          {description = "run oblogout", group = "XF86 keys"}),
      -- Volume Keys
      awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("amixer -q -D pulse sset Master 5%-") end,
          {description = "lower volumne", group = "XF86 keys"}),
      awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("amixer -q -D pulse sset Master 5%+") end,
          {description = "raise volumne", group = "XF86 keys"}),
      awful.key({}, "XF86AudioMute", function() awful.spawn("amixer -D pulse set Master 1+ toggle") end,
          {description = "mute", group = "XF86 keys"}),
      -- Media Keys
      awful.key({}, "XF86AudioPlay", function() awful.spawn("mpc toggle") end,
          {description = "mpc play", group = "XF86 keys"}),
      awful.key({}, "XF86AudioStop", function() awful.spawn("mpc stop") end,
          {description = "mpc stop", group = "XF86 keys"}),
      awful.key({}, "XF86AudioNext", function() awful.spawn("mpc next") end,
          {description = "mpc next", group = "XF86 keys"}),
      awful.key({}, "XF86AudioPrev", function() awful.spawn("mpc prev") end,
          {description = "mpc prev", group = "XF86 keys"}),
      -- Screen Brightness Control
      awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("light -U 5") end,
          {description = "brightness -5%", group = "XF86 keys"}),
      awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("light -A 5") end,
          {description = "brightness +5%", group = "XF86 keys"}),
      -- Screenshot Keys
      awful.key({}, "Print", function()  awful.spawn("flameshot gui") end,
          {description = "capture screen", group = "XF86 keys"}),
      -- awful.key({"Shift"}, "Print", function()  
      --   awful.spawn(scripts_path .. "screenshot.sh root")
      -- end),

      -- Keyboard LED 
      awful.key({}, "Scroll_Lock", function()  awful.spawn("xset led 3") end,
          {description = "keyboard led on", group = "XF86 keys"}),
      awful.key({"Shift"}, "Scroll_Lock", function()  awful.spawn("xset -led 3") end,
          {description = "keyboard led off", group = "XF86 keys"}),
      -- Touchpad Toggle
      awful.key({}, "XF86TouchpadToggle", function()  awful.spawn(scripts_path .. "toggletouchpad.sh") end,
          {description = "touchpad toggle", group = "XF86 keys"}),
    -- }}}
    
    --{{{ launcher group
    -- awful.key({ super_key },            "r",     function () awful.screen.focused().mypromptbox:run() end,
    --           {description = "run prompt", group = "launcher"}),
    awful.key({ super_key },            "r",     function () awful.spawn("rofi -show run") end,
              {description = "rofi run", group = "launcher"}),
    awful.key({ super_key, },           "o",     function () awful.spawn("dmenu_extended_run") end,
              {description = "run rofi-extended", group = "launcher"}),
    awful.key({ super_key }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    awful.key({ super_key },            "p",    function() awful.spawn("rofi -show drun -display-drun 'Program' -show-icons") end,
              {description = "show programs", group = "launcher"}),
    -- awful.key({ super_key }, "p", function() menubar.show() end,
    --}}}
    
    --{{{ layout group
    awful.key({ super_key,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ super_key,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ super_key            }, "-",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ super_key, "Shift"   }, "=",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ super_key, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ super_key, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ super_key,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ super_key, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    --}}}

    --{{{ screen group
    awful.key({ super_key, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ super_key, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ super_key, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ super_key, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    --}}}

    --{{{ programs group
    -- terminal
    awful.key({ super_key,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    -- awful.key({ super_key, shift_key }, "Return", function () awful.spawn(terminal_cmd .. "fish -c" .. 'tmux_load_or_new_session Daily') end, 
    awful.key({ super_key, shift_key }, "Return", function () awful.spawn(terminal_cmd .. "fish -c 'tmux_load_or_new_session Daily'") end, 
        {description = "open tmux with session Daily", group = "launcher"}),
    
    -- terminal program TODO write a function to simplify
    awful.key({ super_key, alt_key }, "h", function () awful.spawn(terminal .. " -t htop -e fish -c htop") end,
              {description = "open htop in terminal", group = "programs"}),
    awful.key({ super_key, alt_key }, "r", function () awful.spawn(terminal .. " -t ranger -e fish -c ranger") end,
              {description = "open ranger in terminal", group = "programs"}),
    awful.key({ super_key, alt_key }, "v", function () awful.spawn(terminal .. " -t vifm -e fish -c vifmrun") end,
              {description = "open vifm in terminal", group = "programs"}),
    awful.key({ super_key, alt_key }, "n", function () awful.spawn(terminal .. " -t ncmpcpp -e fish -c ncmpcpp") end,
              {description = "open ncmpcpp in terminal", group = "programs"}),
    awful.key({ super_key, alt_key }, "m", function () awful.spawn(terminal .. " -t neomutt -e fish -c neomutt") end,
              {description = "open neomutt in terminal", group = "programs"}),

    -- non terminal program
    awful.key({ super_key, alt_key }, "f", function () awful.spawn("firefox") end,
              {description = "run firefox", group = "programs"}),
    awful.key({ super_key, alt_key }, "t", function () awful.spawn("thunar") end,
              {description = "run thunar", group = "programs"}),
    awful.key({ super_key, alt_key }, "e", function () awful.spawn("rofiunicode") end,
              {description = "select unicode/emojis", group = "programs"}),
    awful.key({ super_key, alt_key }, "p", function () awful.spawn("passmenu") end,
              {description = "select passwords", group = "programs"}),
    awful.key({ super_key, alt_key }, "c", function () awful.spawn("clipmenu") end,
              {description = "select from clipboards", group = "programs"}),
    -- awful.key({ super_key, alt_key }, "s", function () awful.spawn("spacefm") end,
    --           {description = "run spacefm", group = "programs"}),

    --}}}

    --{{{ system group
    awful.key({ super_key, "Shift" }, "Page_Down", function () awful.spawn("oblogout") end,
    {description = "run oblogout", group = "system"}),
    awful.key({ super_key, "Shift" }, "s", function () awful.spawn.easy_async_with_shell(suspend_command) end,
    {description = "suspend the system", group = "system"}
    ),
    awful.key({ super_key, "Shift" }, "l", function () awful.spawn(lockscreen_command) end,
    {description = "lock screen", group = "system"}),
    --}}}

    -- {{{ tag group
    awful.key({ super_key,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ super_key,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ super_key,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"})
    -- }}}
)
--}}}

--{{{ Client keys
clientkeys = gears.table.join(
    awful.key({ super_key,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ super_key }, "b",
        function ()
            myscreen = awful.screen.focused()
            myscreen.mywibox.visible = not myscreen.mywibox.visible
        end,
        {description = "toggle statusbar", group = "client"}),
    awful.key({ super_key }, "t",
        function (c)
             -- toggle titlebar
             awful.titlebar.toggle(c)
         end,
         {description = "toggle titlebar", group = "client"}),
    awful.key({ super_key, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ super_key, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ super_key, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ super_key, "Shift"   }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    --[[
    awful.key({ super_key,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    --]]
    awful.key({ super_key,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ super_key,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ super_key, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ super_key, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)
--}}}

--{{{ Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ super_key }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag "..tag_names[i], group = "tag"}),
        -- Toggle tag display.
        awful.key({ super_key, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ super_key, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag "..tag_names[i], group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ super_key, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag "..tag_names[i], group = "tag"})
    )
end
--}}}


-- Set keys
root.keys(globalkeys)

-- {{{ Mouse bindings of root desktop screen
root.buttons(gears.table.join(
    awful.button({ }, 1, function () mymainmenu:toggle() end),
    awful.button({ }, 2, function () awful.spawn("sxiv " .. wallpaper_path) end),
    awful.button({ }, 3, function () awful.spawn("rightclickmenu") end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext)
))
-- }}}
