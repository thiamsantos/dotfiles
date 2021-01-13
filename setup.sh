#!/bin/sh

set -e

export HOME="/home/thiago"
DOTFILES="$HOME/dotfiles"

sudo apt update && \
  sudo apt install --yes git ansible

git config --global user.name "Thiago Santos" && \
  git config --global user.email thia.mdossantos@gmail.com

if [ ! -d $DOTFILES ]; then
  git clone git@github.com:thiamsantos/dotfiles.git $DOTFILES
fi

cd $DOTFILES && \
  git pull --rebase && \
  ansible-galaxy collection install -r requirements.yml && \
  ANSIBLE_NOCOWS=1 ansible-playbook -K -i hosts "$DOTFILES/setup.yml"
