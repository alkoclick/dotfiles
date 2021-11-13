#!/usr/bin/env bash

# Terminal and looks
sudo apt-get install fonts-firacode xclip

curl -o starship_install.sh -sSL "https://starship.rs/install.sh" \
  && chmod +x starship_install.sh \
  && ./starship_install.sh -y
# We don't remove the file at the end, so we can track what we actually run

snap install micro --classic


# Tooling

## Lazygit because default git cli is pain
curl -o lazygit.tar.gz -sSL https://github.com/jesseduffield/lazygit/releases/download/v0.31.3/lazygit_0.31.3_Linux_x86_64.tar.gz
tar -xvf lazygit.tar.gz lazygit
sudo mv lazygit /usr/local/bin/
