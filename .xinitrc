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

xrdb -merge ~/.Xresources

DEFAULT_SESSION='xmonad'

VBoxClient-all &
xcompmgr &
urxvtd &
case "$1" in
    awesome|xmonad)
        exec ck-launch-session "$1"
        ;;
    *)
        exec ck-launch-session "$DEFAULT_SESSION"
        ;;
esac

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# vim: set et sts=4 sw=4 tw=0 :
