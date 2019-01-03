#!/bin/sh

# merge in defaults and keymaps

if [ -f "/etc/X11/xinit/.Xresources" ]; then
    xrdb -merge "/etc/X11/xinit/.Xresources"
fi

sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

source $HOME/.xprofile

exec i3
