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

# start some programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xrandr --output DVI-D-0 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --right-of DVI-D-0
#xrandr --output HDMI-0 --mode 1920x1080 --output DVI-D-0 --mode 1920x1080 --right-of HDMI-0

# polybar
(sleep 1s && "$HOME/.config/polybar/launch.sh") &

# wallpaper
nitrogen --restore &

# audio
pulseaudio &

# compositor
picom &

# numlock 
numlockx &

# start dunst notification daemon
dunst &

# terminal
(sleep 1s && "/usr/bin/kitty") &

# loop
while true; do
    dwm >/dev/null 2>&1
done

# execute dwm
exec dwm

