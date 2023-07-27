#!/usr/bin/env bash

sudo apt install -y \
    i3xrocks-rofication \
    i3xrocks-cpu-usage \
    i3xrocks-memory \
    i3xrocks-battery

sudo apt install -y regolith-look-*

sudo apt remove -y i3xrocks-net-traffic

echo "i3-wm.bar.position:  top" >> ~/.config/regolith2/Xresources

