#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
# invoke global x session script
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xinput set-prop 14 "Device Enabled" 0 #disable trackpad
(sleep 1s && "$HOME/.config/polybar/launch.sh") & #polybar
nitrogen --restore & #wallpaper
pulseaudio & #audio
picom & #compositor
numlockx & #numlock
dunst & #notifications
(sleep 1s && "/usr/bin/kitty") & #launch terminal
(sleep 2s && exec wmname dwm) &
while true; do
    dwm >/dev/null 2>&1
done
exec dwm #execute dwm

