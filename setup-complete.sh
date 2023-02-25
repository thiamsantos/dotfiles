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
    sudo chown thiago:thiago "$HOME/bin"
    mkdir -p "$HOME/src"
    sudo chown thiago:thiago "$HOME/src"
    mkdir -p "$HOME/.config"
    sudo chown thiago:thiago "$HOME/.config"

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
    mkdir -p "$HOME/.oh-my-zsh/custom/themes"
    mkdir -p "$HOME/.oh-my-zsh/custom/plugins"

    if [ ! -d "$HOME/.oh-my-zsh" ]
    then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    zsh_autosuggestions_folder="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

    if [ ! -d "$zsh_autosuggestions_folder" ]
    then
        git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_autosuggestions_folder
    fi

    zsh_fzf_tab="$HOME/.oh-my-zsh/custom/plugins/fzf-tab"

    if [ ! -d "$zsh_fzf_tab" ]
    then
        git clone https://github.com/Aloxaf/fzf-tab $zsh_fzf_tab
    fi

    zsh_fast_syntax_highlighting="$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting"

    if [ ! -d "$zsh_fast_syntax_highlighting" ]
    then
        git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $zsh_fast_syntax_highlighting
    fi

    dracula_theme="$HOME/src/dracula-zsh-theme"

    if [ ! -d "$dracula_theme" ]
    then
        git clone https://github.com/dracula/zsh.git $dracula_theme
        ln -s "$dracula_theme/dracula.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/dracula.zsh-theme"
    fi

    dracula_highlighting="$HOME/src/dracula-zsh-syntax-highlighting"

    if [ ! -d "$dracula_highlighting" ]
    then
        git clone https://github.com/dracula/zsh-syntax-highlighting.git $dracula_highlighting
    fi

    ln -sf "$HOME/dotfiles/files/zshrc" "$HOME/.zshrc"

    sudo usermod --shell /bin/zsh $USER
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
    # TODO: greenclip
    # TODO: rofi
    # TODO: rofi-emoji
    # TODO: rofi-calc
    # TODO: i3status-rs
    # TODO: dunst
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

setup_spotify() {
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -

    spotify_source="/etc/apt/sources.list.d/spotify.list"

    if [ ! -e $spotify_source ]
    then
        echo "deb http://repository.spotify.com stable non-free" | sudo tee $spotify_source
        sudo apt-get update
    fi

    sudo apt-get install -y spotify-client
}

setup_chrome() {
    curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

    chrome_source="/etc/apt/sources.list.d/google-chrome.list"

    if [ ! -e $chrome_source ]
    then
        echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee $chrome_source
        sudo apt-get update
    fi

    sudo apt-get install -y google-chrome-stable
}

setup_zoom() {
    sudo apt-get install -y \
       libglib2.0-0 \
       libgstreamer-plugins-base1.0-0 \
       libxcb-shape0 \
       libxcb-shm0 \
       libxcb-xfixes0 \
       libxcb-randr0 \
       libxcb-image0 \
       libfontconfig1 \
       libgl1-mesa-glx \
       libxi6 \
       libsm6 \
       libxrender1 \
       libpulse0 \
       libxcomposite1 \
       libxslt1.1 \
       libsqlite3-0 \
       libxcb-keysyms1 \
       libxcb-xtest0

    zoom_output="/tmp/zoom_amd64.deb"
    wget -O $zoom_output https://zoom.us/client/latest/zoom_amd64.deb
    sudo dpkg -i $zoom_output
    rm -rf $zoom_output
}

setup_docker() {
    sudo apt-get purge -y \
        docker \
        docker-engine \
        docker.io \
        containerd \
        runc

    curl -sS https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


    docker_source="/etc/apt/sources.list.d/docker.list"

    if [ ! -e $docker_source ]
    then
        echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" | sudo tee $docker_source
        sudo apt-get update
    fi

    sudo apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-compose-plugin

    sudo groupadd -f docker
    sudo usermod -aG docker $USER
}

setup_terraform() {
    curl -sS https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

    terraform_source="/etc/apt/sources.list.d/terraform.list"

    if [ ! -e $terraform_source ]
    then
        echo "deb [arch=amd64] https://apt.releases.hashicorp.com focal main" | sudo tee $terraform_source
        sudo apt-get update
    fi

    sudo apt-get install -y terraform
}

setup_dropbox() {
    sudo apt-get install -y dropbox
}

setup_logseq() {
    download_output="/tmp/Logseq-linux-x64-0.8.17.zip"
    wget https://github.com/logseq/logseq/releases/download/0.8.17/Logseq-linux-x64-0.8.17.zip -O $download_output
    unzip -fo $download_output -d "$HOME/bin"
    ln -sf "$HOME/dotfiles/files/logseq.desktop" "$HOME/.local/share/applications/logseq.desktop"
}

# TODO: bash formatter and linter
# TODO: setup dotfiles folder
sudo apt-get update
# sudo apt-get upgrade
sudo apt-get autoremove -y
sudo apt-get autoclean
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
setup_spotify
setup_chrome
# setup_zoom
setup_docker
setup_terraform
setup_dropbox
setup_logseq

# TODO: accept argument to run only one dep
# TODO: alacritty
# TODO: doom emacs
# TODO: fly.io
# TODO: golang
# TODO: vscode
# TODO: ln all dotfiles
