#!/usr/bin/env bash

if grep -q "source ~/.bashrc_addons" ~/.bashrc
then
  echo "Not adding source as it already exists"
else
  echo "source ~/.bashrc_addons" >> ~/.bashrc
fi

# Symlink stuff
echo "Symlinking dotfiles..."
ln -sf "$PWD/.bashrc_addons" ~/.bashrc_addons
ln -sf "$PWD/.bash_aliases" ~/.bash_aliases
ln -sf "$PWD/.gitconfig" ~/.gitconfig
cp .gitconfig_custom ~/.gitconfig_custom
ln -sf "$PWD/.config/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/.config/micro/bindings.json" ~/.config/micro/bindings.json
ln -sf "$PWD/.config/micro/settings.json" ~/.config/micro/settings.json

# Source to see the results

echo 'All done, `source .bashrc` so you can see results :)'
