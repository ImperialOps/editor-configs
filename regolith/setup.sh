#!/usr/bin/env bash

sudo apt update

sudo apt install -y \
    gnome-screenshot \
    xclip
# Set keyboard shortcut
# Settings -> Keyboard -> View and Customize Shortcuts -> Custom Shortcuts
# sh -c "gnome-screenshot -c -a -f /tmp/test && cat /tmp/test | xclip -i -selection clipboard -target image/png"

sudo apt install -y \
    i3xrocks-rofication \
    i3xrocks-cpu-usage \
    i3xrocks-memory \
    i3xrocks-battery

sudo apt install -y regolith-look-*

sudo apt remove -y i3xrocks-net-traffic

echo "i3-wm.bar.position:  top" >> ~/.config/regolith2/Xresources