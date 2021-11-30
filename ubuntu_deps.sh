#!/usr/bin/env bash

# Exit if any of the intermediate steps fail
set -e

# As a developer, you get one curlbash for free
# This is ours, to install Homebrew
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null


# Terminal and looks
sudo apt-get install fonts-firacode xclip > /dev/null
brew install -q starship fzf


# Tooling

## Lazygit because default git cli is pain and Micro because nano is not enough
brew install -q jesseduffield/lazygit/lazygit micro


echo "Installation done! If this is a long-term system, consider running the bells_and_whistles.sh script as well."
