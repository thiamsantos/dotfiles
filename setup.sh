#!/bin/sh

export HOME="/home/thiago"

git config --global user.name "Thiago Santos" && \
	git config --global user.email thia.mdossantos@gmail.com

sudo apt update && \
	sudo apt install --yes git ansible

DOTFILES="$HOME/dev/thiamsantos"

if [ ! -d "$HOME/dev/thiamsantos/dotfiles" ]; then
    mkdir -p "$HOME/dev/thiamsantos"
    cd "$HOME/dev/thiamsantos"
    git clone git@github.com:thiamsantos/dotfiles.git
fi
