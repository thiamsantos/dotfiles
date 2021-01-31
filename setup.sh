#!/bin/sh

set -e

export HOME="/home/thiago"
DOTFILES="$HOME/dotfiles"

sudo apt update &&
  sudo apt install --yes git python3 python3-venv python3-pip && \
  pip3 install ansible

git config --global user.name "Thiago Santos" && \
  git config --global user.email thia.mdossantos@gmail.com

if [ ! -d $DOTFILES ]; then
  git clone git@github.com:thiamsantos/dotfiles.git $DOTFILES
fi

cd $DOTFILES && \
  git pull --rebase && \
  ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3 ANSIBLE_NOCOWS=1 ansible-galaxy collection install -r requirements.yml && \
  ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3 ANSIBLE_NOCOWS=1 ansible-playbook -K -i hosts "$DOTFILES/setup.yml"
