#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

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
