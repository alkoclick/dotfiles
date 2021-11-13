#!/usr/bin/env bash

sudo apt-get install fonts-firacode

curl -o starship_install.sh -sSL "https://starship.rs/install.sh" \
  && chmod +x starship_install.sh \
  && ./starship_install.sh -y
# We don't remove the file at the end, so we can track what we actually run
