#!/usr/bin/env bash

set -e

sudo rm -rf /var/cache/snapd/
mount | grep snap | cut -d ' ' -f 3 | xargs sudo umount
sudo snap remove $(snap list | awk '!/^Name|^core/ {print $1}')
sudo apt autoremove --purge snapd gnome-software-plugin-snap
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd

sudo apt-mark hold snapd
