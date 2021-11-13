#!/usr/bin/env bash

# Minimal dependencies for comfortably using a terminal
echo "Installing CLI dependencies via Homebrew..."
brew install starship

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

# Source to see the results

echo "All done, sourcing so you can see results :)"
source ~/.bashrc
