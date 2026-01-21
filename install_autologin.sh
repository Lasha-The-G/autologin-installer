#!/bin/sh

if [[ $# -eq 0 ]] then
	echo "Pass username argument"
	exit
else
	echo "Registering autologin for '$1'"
fi

echo "[[ -z \$DISPLAY && \$XDG_VTNR -eq 1 ]] && exec start-hyprland" >> ~/.bash_profile
cat ~/.bash_profile

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
echo -e "[Service]\nExecStart=\nExecStart=-/usr/bin/agetty --autologin $1 --noclear %I \$TERM" | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

sudo systemctl enable getty@tty1
