#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# use UTF-8 everywhere
export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp ~/.fonts
for font in /usr/local/share/fonts/*; do
        xset +fp "${font}"
        done
        xset fp rehash


mkdir /tmp/${USER}-runtime && chmod -R 0700 /tmp/${USER}-runtime

export XDG_RUNTIME_DIR=/tmp/${USER}-runtime

xrdb -merge ~/.Xresources 
xset b off && feh --bg-fill "/home/${USER}/picture/wall.jpg"
# disable system beep
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &
picom --config ~/.picom.conf & 
exec spectrwm
#exec dwm
