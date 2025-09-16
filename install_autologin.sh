#!/bin/sh

echo "[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland" >> ~/.bash_profile
cat ~/.bash_profile

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
echo -e "[Service]\nExecStart=\nExecStart=-/usr/bin/agetty --autologin <Your-Username-Here> --noclear %I \$TERM" | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

sudo systemctl enable getty@tty1
