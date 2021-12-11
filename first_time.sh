#!/usr/bin/env bash

# Run this script when setting up a new system for the first time

# Exit if any of the intermediate steps fail
set -e

# As a developer, you get one curlbash for free before the guilt kicks in
# This is ours, to install Homebrew
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

# For this session, link brew (after Terraforming it'll be in .bashrc)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# We need Terraform to run everything else
# But first... https://www.youtube.com/watch?v=kdemFfbS5H0
# Okay yeah, other than that, terraform in homebrew depends on gcc: https://github.com/Homebrew/homebrew-core/blob/master/Formula/terraform.rb#L25
# This is pretty annoying because the download in 350Mb and the unpacked size 500, and also: https://stackoverflow.com/questions/24966404/brew-install-gcc-too-time-consuming
# In fact, we actually already have THE EXACT SAME VERSION of gcc in the container
# Installing without dependencies is next to impossible in Homebrew, in fact the cli arg for it is actually a no-op since 2021
# To skip installing gcc, we need to trick Homebrew into thinking it's installed
# Some more context in my Medium article: https://link.medium.com/kO9875K6Slb
mkdir -p $HOMEBREW_CELLAR/binutils/2.37/bin $HOMEBREW_CELLAR/gcc/11.2.0_3/bin
brew install -q terraform

# TODO Remove this workaround, added because the provider is somehow initialized :/
export OP_SESSION_my=1
# TODO Also would be good to clean these up
export TF_VAR_email="alkoclick@gmail.com"

terraform init
terraform apply -auto-approve

# Remove the cache which has all the downloaded Homebrew stuff
rm -rf ~/.cache

echo "Installation done! "
