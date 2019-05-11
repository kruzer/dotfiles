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

# start some nice programs
feh --bg-max -r --randomize 	~/Pictures/wallpapers & 
#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi
# notify manager:
dunst &

# keyboard - pl
setxkbmap -layout pl
# keyboard speed
xset r rate 200 40

# transparency
xcompmgr -c  &

# statusbar
~/suckless/slstatus/slstatus &

#while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#do
#	sleep 1
#done &
#variety -v -n &
#exec ~/suckless/dwm/dwm
~/suckless/dwm/dwm

