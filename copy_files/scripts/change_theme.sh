#!/usr/bin/env bash

if [ $(gsettings get org.gnome.desktop.interface 'gtk-theme') == "'Yaru'" ]; then
    gsettings set org.gnome.desktop.interface 'gtk-theme' 'Yaru-dark' && gsettings set org.gnome.gedit.preferences.editor 'scheme' 'Yaru-dark'
else
    gsettings set org.gnome.desktop.interface 'gtk-theme' 'Yaru' && gsettings set org.gnome.gedit.preferences.editor 'scheme' 'Yaru'
fi
