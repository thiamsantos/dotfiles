# dotfiles

[Ansible](https://www.ansible.com/) setup for my local enviroment.
Tested with [Linux Mint 20 “Ulyana” MATE](https://blog.linuxmint.com/?p=3929).

```sh
$ curl -s https://raw.githubusercontent.com/thiamsantos/dotfiles/master/setup.sh | sh
```

## Software included

- [alacritty](https://github.com/alacritty/alacritty)
- [asdf](https://github.com/asdf-vm/asdf)
- [blueman](https://github.com/blueman-project/blueman)
- [docker](https://www.docker.com/)
- [elixir](https://elixir-lang.org/) via [asdf-elixir](https://github.com/asdf-vm/asdf-elixir)
- [erlang](https://www.erlang.org/) via [asdf-erlang](https://github.com/asdf-vm/asdf-erlang)
- [golang](https://golang.org/)
- [google chrome](https://www.google.com/chrome/index.html)
- [node](https://nodejs.org/) via [nvm](https://github.com/nvm-sh/nvm)
- [pgcli](https://github.com/dbcli/pgcli)
- [ruby](https://www.ruby-lang.org/) via [asdf-ruby](https://github.com/asdf-vm/asdf-ruby)
- [rust](https://www.rust-lang.org/)
- [spotify](https://www.spotify.com)
- [terraform](https://www.terraform.io/)
- [tmux](https://github.com/tmux/tmux)
- [vim](https://www.vim.org/)
- [vlc](https://www.videolan.org/vlc/)
- [vscode](https://code.visualstudio.com/)
- [yarn](https://yarnpkg.com/) via [yvm](https://github.com/tophat/yvm)
- [zoom](https://zoom.us/)
- xclip
- zsh

## Tmux

Prefix: `Ctrl - a`

### Custom shortcuts

- `Prefix r` - Reload configuration file
- `Prefix -` - Split pane to bottom
- `Prefix |` - Split pane to right
- `Prefix Esc` - Enter copy-mode
- `Prefix p` - Paste from buffer
- `Prefix o` - Open/maximize pane
- `Prefix q` - Kill pane
- `Prefix I` - Installs plugins
- `Prefix w` - Display panes
- `Prefix b` - Previous window
- `Prefix Q` - Kill window
- `Prefix X` - Kill session

### Common shortcuts

- `Prefix c` - New window
- `Prefix n` - Next window
- `Prefix 0-9` - Go to window 0-9
- `Prefix f` - Find window
- `Prefix ,` - Rename window

### Copy mode

- `v` - Start selection
- `y` - Copy selection
