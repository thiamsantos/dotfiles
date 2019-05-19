# zsh

## Installation

```sh
$ apt install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
$ curl -fsSL https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
$ npm install --global pure-prompt
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf
$ apt install tmux
$ gem install tmuxinator
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
- `gc` - `git commit -m`
- `gm` - `git merge`
- `gck` - `git checkout`
- `gpl` - `git pull --rebase`
- `gp` - `git push origin HEAD`
- `gpf` - ` git push origin HEAD --force-with-lease`
- `gb` - `git checkout -b`
- `gsync` - `gck master && gpl && gck - && gm master`

## TODO

- [ ] java installation
- [ ] rust installation
- [ ] go installation
