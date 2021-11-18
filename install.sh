#!/usr/bin/env bash

# Symlink stuff
echo "Symlinking dotfiles..."
rm ~/.bashrc > /dev/null
ln -sf "$PWD/.bashrc" ~/.bashrc
ln -sf "$PWD/.bash_aliases" ~/.bash_aliases
ln -sf "$PWD/.gitconfig" ~/.gitconfig
cp .gitconfig_custom ~/.gitconfig_custom

mkdir -p ~/.config/micro
ln -sf "$PWD/.config/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/.config/micro/bindings.json" ~/.config/micro/bindings.json
ln -sf "$PWD/.config/micro/settings.json" ~/.config/micro/settings.json

# Source to see the results

echo 'All done, `source .bashrc` so you can see results :)'
