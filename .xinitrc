#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.Xresources
feh --bg-fill ~/.wallpaper/current.jpg &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
conky &
xmodmap ~/.Xmodmap &
xbindkeys &
termite --exec='bspc monitor LVDS1 -d i ii iii iv v vi vii viii ix x' &
termite &
termite &
compton &
#exec fluxbox
exec bspwm -c ~/.config/bspwm/bspwmrc
