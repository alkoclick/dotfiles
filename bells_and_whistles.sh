#!/usr/bin/env bash

# This file contains stuff you'll need to run in machines that have actual screens and that you'll be running for a long time
set -e

# UI
# Alt-tab only on current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# Alt-tab across windows
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications []
sudo apt install -y --no-install-recommends gnome-tweaks

# Gnome Terminal setup
default_profile=$(dconf read /org/gnome/terminal/legacy/profiles:/default | { read in; echo ${in:1:-1}; })
dconf_write_path="/org/gnome/terminal/legacy/profiles:/:$default_profile"
dconf write "$dconf_write_path/background-color" "'rgb(23,20,33)'"
dconf write "$dconf_write_path/bold-color-same-as-fg" true
dconf write "$dconf_write_path/cursor-colors-set" false
dconf write "$dconf_write_path/use-system-font" false
dconf write "$dconf_write_path/font" "'Ubuntu Mono 15'"
dconf write "$dconf_write_path/foreground-color" "'rgb(208,207,204)'"
dconf write "$dconf_write_path/highlight-colors-set" false
dconf write "$dconf_write_path/use-theme-colors" false
dconf write "$dconf_write_path/use-theme-transparency" false
dconf write "$dconf_write_path/use-transparent-background" true
dconf write "$dconf_write_path/background-transparency-percent" 10
dconf write "/org/gnome/terminal/legacy/keybindings/close-tab" "'<Primary>w'"
dconf write "/org/gnome/terminal/legacy/keybindings/prev-tab" "'<Alt>Left'"
dconf write "/org/gnome/terminal/legacy/keybindings/next-tab" "'<Alt>Right'"

# Automated upgrades
sudo apt install -y unattended-upgrades apt-listchanges bsd-mailx
sudo cp 65custom-upgrades /etc/apt/apt.conf.d/65-custom-upgrades
echo "If you're on 22.04 yet, consider finding and enabling Livepatch!"

# Brave: https://brave.com/linux/
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -y --no-install-recommends brave-browser
