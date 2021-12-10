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
brew install -q terraform

## OnePassword is not on any package managers, though this should eventually move to TF :/
if ! command -v op &> /dev/null
then
  curl https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_linux_amd64_v1.12.3.zip --output op.zip
  unzip op.zip
  sudo mv op /usr/local/bin/op
  rm op.*
fi

# TODO Remove this workaround, added because the provider is somehow initialized :/
export OP_SESSION_my=1
# TODO Also would be good to clean these up
export TF_VAR_email="alkoclick@gmail.com"
export TF_VAR_gpg_key=1

terraform init
terraform apply -auto-approve

echo "Installation done! "
