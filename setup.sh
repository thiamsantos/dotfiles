#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

initial_folder="$(pwd)"

export HOME="/home/thiago"
export UBUNTU_CODENAME="jammy"

mkdir -p "$HOME/.dotfiles"
mkdir -p "$HOME/bin"
mkdir -p "$HOME/src"
mkdir -p "$HOME/dev/finbits"
mkdir -p "$HOME/dev/thiamsantos"
mkdir -p "$HOME/.docker/cli-plugins"
mkdir -p "$HOME/.config/doom"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/i3status-rust"
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/dunst"
mkdir -p "$HOME/.zsh_functions"
mkdir -p "$HOME/.zsh_cache/completions"
mkdir -p "$HOME/.terraform.d/plugin-cache"

curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg --yes
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg --yes
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg --yes
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
do
    sudo apt-get remove --yes $pkg
done

apt remove --purge --yes libreoffice*

apt autoclean
apt autopurge
apt autoremove
apt update
apt upgrade -y

apt install -y \
    1password \
    autoconf \
    bison \
    blueman \
    bluez \
    bluez-tools \
    build-essential \
    ca-certificates \
    cheese \
    chromium-browser \
    cmake \
    compton \
    compton \
    cowsay \
    curl \
    direnv \
    dunst \
    editorconfig \
    fd-find \
    ffmpeg \
    flameshot \
    flatpak \
    fop \
    fonts-font-awesome \
    fzf \
    git \
    groff \
    i3 \
    imagemagick \
    imagemagick \
    inotify-tools \
    jq \
    libcurl4-openssl-dev \
    libdb-dev \
    libexif-dev \
    libffi-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libgdbm-dev \
    libgdbm6 \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libimlib2-dev \
    libncurses-dev \
    libncurses5-dev \
    libnotmuch-dev \
    libpipewire-0.3-dev \
    libpng-dev \
    libpq-dev \
    libpulse-dev \
    libpulse0 \
    libreadline6-dev \
    libsensors-dev \
    libssh-dev \
    libssl-dev \
    libtest-command-perl \
    libtest-simple-perl \
    libwxgtk3.0-gtk3-dev \
    libx11-dev \
    libxcb-screensaver0 \
    libxcb-screensaver0-dev \
    libxcb-xfixes0-dev \
    libxcb1 \
    libxcb1-dev \
    libxinerama-dev \
    libxkbcommon-dev \
    libxml2-utils \
    libxss-dev \
    libxss1 \
    libxt-dev \
    libyaml-dev \
    lxappearance \
    m4 \
    openjdk-11-jdk \
    pandoc \
    pkg-config \
    playerctl \
    playerctl \
    postgresql-client \
    python3 \
    python3-pip \
    python3-venv \
    rofi \
    scrot \
    scrot \
    shellcheck \
    silversearcher-ag \
    spotify-client \
    stow \
    terraform \
    tidy \
    unixodbc-dev \
    unzip \
    vim \
    vim-gtk \
    vlc \
    wget \
    xclip \
    xsltproc \
    zlib1g-dev \
    zsh
# TODO: format
sudo apt install --yes build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libgnutls28-dev gcc-10 libgccjit-10-dev libjansson4 libjansson-dev


sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev \
         libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev \
              libjansson-dev libharfbuzz-dev libharfbuzz-bin imagemagick libmagickwand-dev libgccjit-10-dev libgccjit0 gcc-10 libjansson4 libjansson-dev xaw3dg-dev texinfo libx11-dev

export CC="gcc-10"



# TODO: stop using flatpak
flatpak install -y flathub org.ferdium.Ferdium
flatpak install -y flathub us.zoom.Zoom

if [ ! -d "$HOME/.cargo/bin" ]
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

. "$HOME/.cargo/env"

rustup override set stable
rustup update stable


emacs_folder="$HOME/src/emacs"

if [ ! -d "$emacs_folder" ]
then
    git clone --depth 1 --branch emacs-29.3 git://git.savannah.gnu.org/emacs.git $emacs_folder
fi

if ! [ -x "$(command -v emacs)" ]
then
    cd $emacs_folder
    ./autogen.sh
    ./configure --with-native-compilation --with-json
    make -j$(nproc)
    sudo make install
    cd "$initial_folder"
fi

feh_folder="$HOME/src/feh"

if [ ! -d "$feh_folder" ]
then
    git clone https://github.com/derf/feh.git $feh_folder
fi

if ! [ -x "$(command -v feh)" ]
then
    cd $feh_folder
    make
    sudo make install app=1
    cd "$initial_folder"
fi

if ! [ -x "$(command -v greenclip)" ]
then
    wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip --directory-prefix "$HOME/bin"
    sudo chmod +x "$HOME/bin/greenclip"
fi

alacritty_folder="$HOME/src/alacritty"
if [ ! -d "$alacritty_folder" ]
then
    git clone https://github.com/alacritty/alacritty.git $alacritty_folder
fi

alacritty_release_folder="$HOME/src/alacritty/target/release/alacritty"
if [ ! -e "$alacritty_release_folder" ]
then
    cd $alacritty_folder
    cargo build --release && sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    cd "$initial_folder"
fi

ln -sf "$HOME/src/alacritty/target/release/alacritty" "$HOME/bin/alacritty"

if [ ! -e "/usr/share/applications/Alacritty.desktop" ]
then
    cd $alacritty_folder
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
    cd "$initial_folder"
fi

if [ ! -e "/usr/local/share/man/man1/alacritty.1.gz" ]
then
    cd $alacritty_folder
    sudo mkdir -p /usr/local/share/man/man1
    sudo mkdir -p /usr/local/share/man/man5
    scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
    scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
    scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
    cd "$initial_folder"
fi

ln -sf "$HOME/src/alacritty/extra/completions/_alacritty" "$HOME/.zsh_functions/_alacritty"

asdf_folder="$HOME/.asdf"

if [ ! -d "$asdf_folder" ]
then
    git clone https://github.com/asdf-vm/asdf.git $asdf_folder --branch v0.14.0
fi

. $asdf_folder/asdf.sh

if [ ! -d "$asdf_folder/plugins/nodejs" ]
then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

if [ ! -d "$asdf_folder/plugins/yarn" ]
then
    asdf plugin add yarn
fi

if [ ! -d "$asdf_folder/plugins/erlang" ]
then
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

if [ ! -d "$asdf_folder/plugins/elixir" ]
then
   asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi


if [ ! -d "$asdf_folder/plugins/rust" ]
then
    asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
fi

asdf plugin update --all

if ! [ -x "$(command -v node)" ]
then
    asdf install nodejs 18.12.1
    asdf global nodejs 18.12.1
fi

if ! [ -x "$(command -v yarn)" ]
then
    asdf install yarn 1.22.19
    asdf global yarn 1.22.19
fi

if ! [ -x "$(command -v erl)" ]
then
    asdf install erlang 26.2.1
    asdf global erlang 26.2.1
fi

if ! [ -x "$(command -v elixir)" ]
then
    asdf install elixir 1.16.0-otp-26
    asdf global elixir 1.16.0-otp-26
fi

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd -f docker
sudo usermod -aG docker "$USER"

antigen_folder="$HOME/src/antigen"
if [ ! -d "$antigen_folder" ]
then
    git clone https://github.com/zsh-users/antigen.git $antigen_folder
fi

dracula_highlighting="$HOME/src/dracula-zsh-syntax-highlighting"

if [ ! -d "$dracula_highlighting" ]
then
    git clone https://github.com/dracula/zsh-syntax-highlighting.git $dracula_highlighting
fi

stow --verbose --target=$HOME git zsh asdf vim
stow --verbose --target="$HOME/bin" bin
stow --verbose --target="$HOME/.config/doom" doom
stow --verbose --target="$HOME/.config/rofi" rofi
stow --verbose --target="$HOME/.config/alacritty" alacritty
stow --verbose --target="$HOME/.config/dunst" dunst
stow --verbose --target="$HOME/.config/i3status-rust" i3status-rust
stow --verbose --target="$HOME/.config/i3" i3
stow --verbose --target="$HOME/.config" greenclip
stow --verbose --target="$HOME/.ssh" ssh


doom_emacs_folder="$HOME/.config/emacs"

if [ ! -d "$doom_emacs_folder" ]
then
    git clone --depth 1 https://github.com/doomemacs/doomemacs $doom_emacs_folder
    $doom_emacs_folder/bin/doom install
fi

aws_download_folder="/tmp/awscliv2"

if ! [ -x "$(command -v aws)" ]
then

    mkdir -p $aws_download_folder
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$aws_download_folder/awscliv2.zip"
    unzip "$aws_download_folder/awscliv2.zip" -d $aws_download_folder
    $aws_download_folder/aws/install --bin-dir "$HOME/bin" --install-dir "$HOME/src/aws-cli"
    rm -rf $aws_download_folder
fi


sudo chsh -s /bin/zsh thiago

cargo install tlrc
cargo install git-delta
cargo install xidlehook --bins

i3status_rust_folder="$HOME/src/i3status-rust"

if [ ! -d "$i3status_rust_folder" ]
then
    git clone https://github.com/greshake/i3status-rust $i3status_rust_folder
fi

if [ ! -e "$HOME/.cargo/bin/i3status-rs" ]
then
    cd $i3status_rust_folder
    cargo install --path . --locked
    ./install.sh
    cd "$initial_folder"
fi

ripgrep_folder="$HOME/src/ripgrep"
if [ ! -d "$ripgrep_folder" ]
then
    git clone https://github.com/BurntSushi/ripgrep $ripgrep_folder
fi


if [ ! -e "$HOME/.cargo/bin/rg" ]
then
    cargo install --path $ripgrep_folder --features 'pcre2'
fi

pip3 install isort pipenv pytest nose

npm -g install js-beautify stylelint

ln -sf "$HOME/dev/finbits/hammer/target/release/ham" "$HOME/bin/ham"
