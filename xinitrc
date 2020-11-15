#!/usr/bin/env bash
#
# This is a sample file for the ~/.xinitrc file.
#

# You may need to comment out the next line to disable access control
#xhost +

# Set themes, etc
#gnome-settings-daemon &

# Set fallback cursor
xsetroot -cursor_name left_ptr

# If Emacs is started in server mode, `emacsclient` is a convenient way to edit
# files in place (used by e.g. `git commit`)
export VISUAL=emacsclient
export EDITOR="$VISUAL"

# Disable access control
xhost +SI:localuser:$USER

## Over-rides
#
xset b off &
#numlockx off                    # Turn off numlock

# Set keyboard repeat rate
xset r rate 300 40

# Set capslock as ctrl
#setxkbmap -layout us -option ctrl:nocaps
sudo setxkbmap -layout 'es,es' -model pc105

# Programs to start upon startup
#volumeicon &
#transmission-daemon &
#/usr/bin/hexo-server.sh &
xmobar .config/xmobar/xmobar.config &
#xfce4-power-manager &
#syncthing -no-browser &         # Syncthing
#nm-applet &                     # Network Manager
#pasystray &                     # Pulseaudio volume control from tray
#udiskie --tray &                # Disk mount utility

# launch emacs upon startup
#exec openbox/session
exec dbus-launch --exit-with-session emacs

