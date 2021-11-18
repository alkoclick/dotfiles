#!/usr/bin/env bash

# This file contains stuff you'll need to run in machines with actual screens, not just terminals

# Alt-tab only on current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# Alt-tab across windows
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications []
