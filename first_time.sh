#!/usr/bin/env bash

# Run this script when setting up a new system for the first time

# Exit if any of the intermediate steps fail
set -e

# As a developer, you get one curlbash for free
# This is ours, to install Homebrew
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

# For this session, link brew (after Terraforming it'll be in .bashrc)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# We need Terraform to run everything else
brew install -q terraform

## OnePassword is not on any package managers :/
if ! command -v op &> /dev/null
then
  curl https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_linux_amd64_v1.12.3.zip --output op.zip
  unzip op.zip
  sudo mv op /usr/local/bin/op
  rm op.*
fi

echo "Installation done! "
