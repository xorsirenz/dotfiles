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

export _JAVA_AWT_WM_NONREPARENTING=1 #fix ghidra parenting issue
#xinput set-prop 11 "Device Enabled" 0
(sleep 2s && "$HOME/.config/polybar/launch.sh") & (sleep 1s)
~/.fehbg &
pulseaudio &
numlockx &
dunst &
picom &
nm-applet &
blueman-applet &
xrdb -merge ~/.Xresources && xrandr --dpi 192
#(sleep 1s && "/usr/bin/kitty") &
(sleep 2s && exec wmname dwm) &
while true; do
    dwm >/dev/null 2>&1
done
exec dwm
