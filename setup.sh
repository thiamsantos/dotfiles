#!/bin/sh

export HOME="/home/thiago"

git config --global user.name "Thiago Santos" && \
	git config --global user.email thia.mdossantos@gmail.com

sudo apt update && \
	sudo apt install --yes git ansible

WORKSPACE="$HOME/dev/thiamsantos"
DOTFILES="$WORKSPACE/dotfiles"

if [ ! -d $DOTFILES ]; then
    mkdir -p $WORKSPACE
    cd $WORKSPACE
    git clone git@github.com:thiamsantos/dotfiles.git
fi

cd $DOTFILES
git pull --rebase
# TODO remove after migration to ansible
git checkout ansible
ansible-playbook -vvv -K -i hosts "$DOTFILES/setup.yml"

