#!/bin/dash

#{{{-
# fcitx/javaamt parameters
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export _JAVA_AWT_WM_NONREPARENTING=1
#export DISPLAY=:0
#-}}}

# What is it doing again?
eval "$(dbus-launch --sh-syntax --exit-with-session)"

#{{{- some configurations (screenlock timeout, touchpad orientation)
synclient HorizEdgeScroll=1 VertEdgeScroll=1 VertScrollDelta=-111 # touchpad
xset s 1800 # sleep time
# wmname LG3D
#-}}}

#{{{- processes to start
~/.fehbg # wallpaper
pgrep fcitx || /usr/bin/fcitx & # input method
pgrep redshift || /usr/bin/redshift &
# mydwmstatus 2>/dev/null & # dwm status bar
xsidle.sh /usr/local/bin/slock &  # screenlock
pgrep mpd || mpd &
pgrep mpc || while true;do mpc idle 2>/dev/null;~/.ncmpcpp/nextsong.sh;done & # music control daemon
pkill -U 1000 wpa_cli ||  wpa_cli -a /home/alex/.scripts/wpa_supplicant_action &  # notify wifi connection
# pgrep sxhkd || /usr/bin/sxhkd & # Simple X hotkey daemon
# pgrep compton || compton -b &
pgrep plank || /usr/bin/plank &
#-}}}


#{{{- start user program in the background
/usr/bin/zim &
# pgrep emacs || emacs --daemon &
#-}}}

#{{{- start window manager
# exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
#-}}}


# vim: filetype=sh
