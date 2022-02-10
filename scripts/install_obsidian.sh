#!/usr/bin/env bash

set -e

curl --GET --location https://github.com/obsidianmd/obsidian-releases/releases/download/v$VERSION/Obsidian-$VERSION.AppImage --output obsidian
chmod +x obsidian
sudo mv obsidian /usr/local/bin/obsidian
