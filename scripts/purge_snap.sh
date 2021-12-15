#!/usr/bin/env bash

set -e

sudo rm -rf /var/cache/snapd/
sudo systemctl stop snapd
mount | grep snap | cut -d ' ' -f 3 | xargs sudo umount || true
sudo snap remove $(snap list | awk '!/^Name|^core/ {print $1}') || true
sudo apt autoremove --purge snapd gnome-software-plugin-snap
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd

sudo apt-mark hold snapd
