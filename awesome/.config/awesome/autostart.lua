local naughty = require("naughty")
local awful = require("awful")
require("variables")

--  {{{ examples
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

-- reference https://awesomewm.org/doc/api/libraries/awful.spawn.html

-- programs
awful.spawn.once(home_path .. ".fehbg")
-- awful.spawn.once(scripts_path .. "weather show")
awful.spawn.single_instance("fcitx")
awful.spawn.single_instance("picom -b")
-- awful.spawn.single_instance("zim")
awful.spawn.single_instance("nextcloud --background")
awful.spawn.single_instance("thunar --daemon")
