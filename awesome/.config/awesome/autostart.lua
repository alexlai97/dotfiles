local naughty = require("naughty")
local awful = require("awful")
require("variables")

--  {{{ examples for spawn callback
-- reference https://awesomewm.org/doc/api/libraries/awful.spawn.html
--
-- local noisy = [[bash -c '
--   for I in $(seq 1 5); do
--     date
--     echo err >&2
--     sleep 2
--   done
-- ']]

-- awful.spawn.with_line_callback(noisy, {
--     stdout = function(line)
--         naughty.notify { text = "LINE:"..line }
--     end,
--     stderr = function(line)
--         naughty.notify { text = "ERR:"..line}
--     end,
-- })
--  }}}


--{{{ programs to spawn on start
awful.spawn.once(home_path .. ".fehbg")
awful.spawn.once("libinput-gestures-setup start")
-- awful.spawn.once(scripts_path .. "weather show")
awful.spawn.single_instance("fcitx")
awful.spawn.single_instance("xss-lock -- " .. lockscreen_command)
awful.spawn.single_instance("picom -b")
-- awful.spawn.single_instance("zim")
awful.spawn.single_instance("nextcloud --background")
awful.spawn.single_instance("thunar --daemon")
--}}} 
