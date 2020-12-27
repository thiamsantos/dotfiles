#!/bin/sh

export HOME="/home/thiago"

git config --global user.name "Thiago Santos" && \
	git config --global user.email thia.mdossantos@gmail.com

sudo apt update && \
	sudo apt install --yes git ansible

DOTFILES="$HOME/dotfiles"

if [ ! -d $DOTFILES ]; then
    git clone git@github.com:thiamsantos/dotfiles.git $DOTFILES
fi

cd $DOTFILES
git pull --rebase
# TODO remove after migration to ansible
git checkout ansible
ansible-playbook -K -i hosts "$DOTFILES/setup.yml"
