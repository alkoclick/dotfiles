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

## OnePassword is not on any package managers :/
if ! command -v op &> /dev/null
then
  curl https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_linux_amd64_v1.12.3.zip --output op.zip
  unzip op.zip
  sudo mv op /usr/local/bin/op
  rm op.*
fi

echo "Installation done! If this is a long-term system, consider running the bells_and_whistles.sh script as well."
