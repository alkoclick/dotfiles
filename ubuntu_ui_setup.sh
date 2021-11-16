#!/usr/bin/env bash

sudo apt-get --no-install-recommends install ubuntu-budgie-desktop\
  &&\
  sudo apt-get autoremove -y

echo 'Budgie has added some crap to your bashrc, remove that manually'
echo 'Also your Chrome-based browser will have an ugly-ass title bar. Go to brave://settings/appearance and deselect "Use system title bar and borders"'
