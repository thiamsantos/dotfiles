#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export HOME="/home/thiago"

setup_base() {
    sudo apt-get install -y \
        git \
        curl \
        direnv \
        flameshot \
        wget \
        xclip \
        vlc \
        bluez \
        bluez-tools \
        blueman \
        ffmpeg \
        cheese \
        jq \
        cowsay \
        inotify-tools \
        fzf \
        1password

    mkdir -p "$HOME/bin"
    mkdir -p "$HOME/src"

    # TODO: set permantently fs.inotify.max_user_watches = 524288 on /etc/sysctl.conf
}

setup_python() {
    sudo apt install -y \
        python3 \
        python3-venv \
        python3-pip
}

setup_vim() {
    sudo apt-get install -y \
        vim \
        vim-gtk \
        silversearcher-ag

    mkdir -p "$HOME/.vim/autoload"

    plug_file="$HOME/.vim/autoload/plug.vim"
    plug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    if [ ! -e "$plug_file" ]
    then
        wget -O $plug_file $plug_url
    fi

    ln -sf "$HOME/dotfiles/files/vimrc" "$HOME/.vimrc"
}

setup_asdf() {
    asdf_folder="$HOME/.asdf"

    if [ ! -d "$asdf_folder" ]
    then
        git clone https://github.com/asdf-vm/asdf.git $asdf_folder--branch v0.8.0
    fi

    . $asdf_folder/asdf.sh

    sudo apt-get install -y \
        build-essential \
        autoconf \
        m4 \
        libncurses5-dev \
        libwxgtk3.0-gtk3-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        libpng-dev \
        libssh-dev \
        unixodbc-dev \
        xsltproc \
        fop \
        libxml2-utils \
        libncurses-dev \
        openjdk-11-jdk

    if [ ! -d "$asdf_folder/plugins/erlang" ]
    then
        asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    fi

    sudo apt-get install -y \
        unzip

    if [ ! -d "$asdf_folder/plugins/elixir" ]
    then
        asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    fi

    sudo apt-get install -y \
       autoconf \
       bison \
       build-essential \
       libssl-dev \
       libyaml-dev \
       libreadline6-dev \
       zlib1g-dev \
       libncurses5-dev \
       libffi-dev \
       libgdbm6 \
       libgdbm-dev \
       libdb-dev

    if [ ! -d "$asdf_folder/plugins/ruby" ]
    then
        asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
    fi

    if [ ! -d "$asdf_folder/plugins/nodejs" ]
    then
        asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    fi

    ln -sf "$HOME/dotfiles/files/asdfrc" "$HOME/.asdfrc"
}

setup_node() {
    if ! [ -x "$(command -v node)" ]
    then
        asdf install nodejs 16.14.0
        asdf global nodejs 16.14.0
    fi

     if [ ! -e "$HOME/.yvm/yvm.sh" ]
    then
        https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
    fi
}

setup_rust() {
    if [ ! -d "$HOME/.cargo/bin" ]
    then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
}

setup_zsh() {
    sudo apt-get install -y zsh

    mkdir -p "$HOME/.zsh_functions"

    if [ ! -d "$HOME/.oh-my-zsh" ]
    then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    # TODO: https://github.com/zdharma-continuum/fast-syntax-highlighting
    # TODO: https://github.com/Aloxaf/fzf-tab
    # TODO: $HOME/src/dracula-zsh-syntax-highlighting/zsh-syntax-highlighting.sh

    zsh_autosuggestions_folder="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

    if [ ! -d "$zsh_autosuggestions_folder" ]
    then
        git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_autosuggestions_folder$
    fi

    ln -sf "$HOME/dotfiles/files/zshrc" "$HOME/.zshrc"

    # TODO: set zsh as default shell
}

setup_postgres() {
    sudo apt-get install -y \
        pgcli \
        postgresql-client \
        libpq-dev
}

setup_redshift() {
    sudo apt-get install -y \
        redshift

    mkdir -p "$HOME/.config/redshift"
    ln -sf "$HOME/dotfiles/files/redshift.conf" "$HOME/.config/redshift/redshift.conf"
}

setup_i3() {
    sudo apt-get install -y \
        i3 \
        scrot \
        imagemagick \
        lxappearance \
        dunst \
        compton \
        playerctl

    # TODO: install all i3 plugins
    # TODO: setup all config files i3
    # TODO: xidlehook
    # TODO: feh
    # TODO: todoist
    # TODO: greenclip
    # TODO: rofi
    # TODO: rofi-emoji
    # TODO: rofi-calc
    # TODO: i3status-rs
    # TODO: dunst
    #
}

setup_awscli() {
    aws_download_folder="/tmp/awscliv2"

    if ! [ -x "$(command -v aws)" ]
    then

        mkdir -p $aws_download_folder
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$aws_download_folder/awscliv2.zip"
        unzip "$aws_download_folder/awscliv2.zip" -d $aws_download_folder
        $aws_download_folder/aws/install --bin-dir "$HOME/bin" --install-dir "$HOME/src/aws-cli"
        rm -rf $aws_download_folder
    fi
}

# TODO: setup dotfiles folder
sudo apt-get update
setup_base
setup_asdf
setup_python
setup_node
setup_rust
setup_vim
setup_postgres
setup_zsh
setup_i3
setup_redshift
setup_awscli


# TODO: dracula
# TODO: dropbox
# TODO: logseq
# TODO: alacritty
# TODO: doom emacs
# TODO: terraform
# TODO: fly.io
# TODO: golang
# TODO: spotify
# TODO: chrome
# TODO: zoom
# TODO: docker
# TODO: vscode
# TODO: ln all dotfiles
