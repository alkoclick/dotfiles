#!/usr/bin/env bash

# This file contains stuff you'll need to run in machines that have actual screens and that you'll be running for a long time

# UI
# Alt-tab only on current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# Alt-tab across windows
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications []


# Automated upgrades
sudo apt install -y unattended-upgrades apt-listchanges bsd-mailx
sudo cp 65custom-upgrades /etc/apt/apt.conf.d/65-custom-upgrades
echo "If you're on 22.04 yet, consider finding and enabling Livepatch!"
