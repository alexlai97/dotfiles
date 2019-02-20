--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/alex/.config/wpg/wallpapers/colorfulsky_clearseas.jpg"

-- Special
background="#221f1e"
foreground="#fffffe"
cursor="#fffffe"

-- Colors
color0="#221f1e"
color1="#bbb9b5"
color2="#8ea8b7"
color3="#c5a265"
color4="#6d97b7"
color5="#ac9f99"
color6="#4980ba"
color7="#c7c7c6"
color8="#373230"
color9="#fff8d3"
color10="#a3e0ff"
color11="#ffd76f"
color12="#7ac6ff"
color13="#f4c6b1"
color14="#4ea5ff"
color15="#fffffe"
