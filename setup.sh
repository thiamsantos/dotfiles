#!/bin/sh

export HOME="/home/thiago"
DOTFILES="$HOME/dotfiles"

git config --global user.name "Thiago Santos" && \
	git config --global user.email thia.mdossantos@gmail.com

sudo apt update && \
	sudo apt install --yes git ansible

if [ ! -d $DOTFILES ]; then
    git clone git@github.com:thiamsantos/dotfiles.git $DOTFILES
fi

cd $DOTFILES && \
	git pull --rebase && \
	ansible-playbook -K -i hosts "$DOTFILES/setup.yml"
