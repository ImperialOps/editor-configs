#!/usr/bin/env bash

sudo apt update

sudo apt install -y \
    gnome-screenshot \
    xclip
# Set keyboard shortcut
# Settings -> Keyboard -> View and Customize Shortcuts -> Custom Shortcuts > Ctrl + Shift + Print
# sh -c "gnome-screenshot -c -a -f /tmp/test && cat /tmp/test | xclip -i -selection clipboard -target image/png"

# Regolith install : https://regolith-desktop.com/
sudo apt install -y \
    regolith-compositor-picom-glx \
    i3xrocks-rofication \
    i3xrocks-cpu-usage \
    i3xrocks-memory \
    i3xrocks-battery

sudo apt install -y regolith-look-*

sudo apt remove -y i3xrocks-net-traffic

mkdir -p ~/.config/regolith2
echo "i3-wm.bar.position:  top" >> ~/.config/regolith2/Xresources
