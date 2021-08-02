local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")

-- {{{ Helper functions
-- FIXME: what does it do again ?
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

-- Helper function to read all content in a file
local function read_line_from_a_file(file)
  local f = assert(io.open(file))
  local t = f:read("*all")
  f:close()
  return t
end

-- set wallpaper
local function set_wallpaper(s)
    -- Wallpaper
    -- if beautiful.wallpaper then
    --     local wallpaper = beautiful.wallpaper
    --     -- If wallpaper is a function, call it with the screen
    --     if type(wallpaper) == "function" then
    --         wallpaper = wallpaper(s)
    --     end
    --     gears.wallpaper.maximized(wallpaper, s, true)
    -- end
    awful.spawn.with_shell(home_path .. ".fehbg")
end
-- }}}

-- {{{ Wibar
-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ myXXX programs
-- mymood
mymood = wibox.widget.textbox(read_line_from_a_file(cache_path .. 'mymood/mymood.txt'))
mymood:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mymood choose") end) ,
  awful.button({ }, 3, function() awful.spawn("mymood ask") end)
))


-- myweather
myweather = awful.widget.watch(scripts_path .. "weather", 3600)
myweather:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("weather show") end) ,
  awful.button({ }, 3, function() awful.spawn("weather reload") end)
))


-- Create a textclock widget
-- mytextclock = wibox.widget.textclock( {format = " %a %b.%d  %T", refresh = 1})
mytextclock = wibox.widget.textclock( "📅 %a %b.%d 🕦 %T", 1)
month_calendar = awful.widget.calendar_popup.month({position = "tr"})
mytextclock:buttons(gears.table.join(
  awful.button({ }, 1, function() month_calendar:toggle() end) 
  -- awful.button({ }, 1, function() awful.spawn("zsh_rofi") end) ,
  -- awful.button({ }, 2, function() awful.spawn("oblogout") end) ,
  -- awful.button({ }, 3, function() awful.spawn("rightclickmenu") end)
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

-- mycorona
mycorona = awful.widget.watch(scripts_path .. "corona oneline", 3600)
mycorona:buttons(gears.table.join(
  awful.button({ }, 1, function() 
      awful.spawn.easy_async("corona", function(stdout, stderr, reason, exit_code) naughty.notify { title = "Corona Update", text = stdout } end)
  end) , 
  awful.button({ }, 3, function() awful.spawn.easy_async_with_shell("corona download; corona update") end) 
))

-- wifi widget
mywifi = awful.widget.watch(scripts_path .. "mywifi", 4)
mywifi:buttons(gears.table.join(
  awful.button({ }, 1, function() awful.spawn("mywifi update") end) ,
  awful.button({ }, 3, function() awful.spawn("mywifi update") end) 
))
-- }}}

-- {{{ mouse buttons for taglist
local taglist_buttons = gears.table.join(
    -- view tag #
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
-- }}} 

-- {{{ mouse buttons for tasklist
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
--}}}


-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- {{{ set wibar for each screen
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    local l = awful.layout.suit  -- Just to save some typing: use an alias.
    local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile }
    awful.tag(tag_names, s, layouts)
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
            -- mycorona,
            -- wibox.widget.textbox(' | '),
            -- myweather,
            -- wibox.widget.textbox(' '),
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

-- }}}
