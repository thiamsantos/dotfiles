# zsh

## Installation

```sh
$ sudo apt install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
$ nvm install --lts
$ curl -fsSL https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
$ npm install --global pure-prompt
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf
$ sudo apt install build-essential autoconf bison m4 libssl-dev libyaml-dev libncurses5-dev libreadline6-dev zlib1g-dev libffi-dev libgdbm-dev libgdbm5 libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop
$ . $HOME/.asdf/asdf.sh
$ asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
$ asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
$ asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
$ echo "legacy_version_file = yes" > $HOME/.asdfrc
$ sudo apt install tmux
$ gem install tmuxinator
$ mkdir -p $HOME/bin
$ curl -0 $HOME/bin/tmuxinator.zsh https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
$ git clone git@github.com:thiamsantos/dotfiles.git /path/to/repo/dotfiles
$ ln -s /path/to/repo/dotfiles/zsh/zshrc ~/.zshrc
```

## Software included

- [zsh](http://zsh.sourceforge.net/) - Z shell
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - Framework for managing your zsh configuration
- [pure](https://github.com/sindresorhus/pure) - Pretty, minimal and fast ZSH prompt
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Fish shell like syntax highlighting for Zsh
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for zsh
- [nvm](https://github.com/nvm-sh/nvm) - Node Version Manager
- [yvm](https://github.com/tophat/yvm) - Yarn Version Manager
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder
- [rbenv](https://github.com/rbenv/rbenv) - Ruby Version Manager
- [asdf](https://github.com/asdf-vm/asdf) - Multiple runtime version manager
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [tmuxinator](https://github.com/tmuxinator/tmuxinator) - Tmux sessions manager

## Aliases

- `ga` - `git add`
- `gap` - `git add -p`
- `gc` - `git commit -m`
- `gm` - `git merge`
- `gck` - `git checkout`
- `gpl` - `git pull --rebase`
- `gp` - `git push origin HEAD`
- `gpf` - ` git push origin HEAD --force-with-lease`
- `gb` - `git checkout -b`
- `gsync` - `gck master && gpl && gck - && gm master`
- `gs` - `git status`

## TODO

- [ ] java installation
- [ ] go installation
