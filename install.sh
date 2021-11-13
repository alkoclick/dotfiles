#!/usr/bin/env bash

# Minimal dependencies for comfortably using a terminal
echo "Installing CLI dependencies via Homebrew..."
brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
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
ln -sf "$PWD/.gitconfig" ~/.gitconfig
ln -sf "$PWD/.gitconfig_custom" ~/.gitconfig_custom

# Source to see the results

echo "All done, sourcing so you can see results :)"
source ~/.bashrc
