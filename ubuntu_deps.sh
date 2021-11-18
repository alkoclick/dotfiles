#!/usr/bin/env bash



# Eget first so we can do everything else more easily
if ! command -v eget &> /dev/null
then
    curl -s -o eget.sh https://zyedidia.github.io/eget.sh
    echo "0e64b8a3c13f531da005096cc364ac77835bda54276fedef6c62f3dbdc1ee919  eget.sh" | sha256sum -c || { echo "Checksum validation failed" && exit 1; }
    chmod +x eget.sh && ./eget.sh && rm eget.sh
    chmod +x eget && sudo mv eget /usr/local/bin/
fi


# Terminal and looks
if ! command -v starship &> /dev/null
then
	sudo apt-get install fonts-firacode xclip > /dev/null
	sudo eget -q --to=/usr/local/bin/ "https://github.com/starship/starship/releases/download/v1.0.0/starship-x86_64-unknown-linux-gnu.tar.gz" --verify-sha256=8952efbcbdf8487273d7467caa3ff87b8917ba00fec1a083a36e9e04a6df5cd3
fi

# Adding a hack to avoid running this in docker due to https://github.com/junegunn/fzf/issues/2480
if [ ! command -v fzf &> /dev/null ] && [ $DEBIAN_FRONTEND != "noninteractive" ]
then 
	sudo apt-get install fzf > /dev/null
fi



# Tooling

## Lazygit because default git cli is pain
if ! command -v lazygit &> /dev/null
then
	sudo eget -q --tag v0.31.3 --to=/usr/local/bin/ jesseduffield/lazygit --verify-sha256=78eff8d126178594a06107c8faff7f27343f4e63281d14fbbc62f6fbb38e5110
fi

## Micro because nano is not enough
## We have to use this form because there are 2 choices (static binary vs linked) and we'd get an interactive prompt
if ! command -v micro &> /dev/null
then
	sudo eget -q --to=/usr/local/bin/ "https://github.com/zyedidia/micro/releases/download/v2.0.10/micro-2.0.10-linux64.tar.gz"
fi
