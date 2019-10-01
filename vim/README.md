# vim

## Installation

```sh
# Download vim-plug
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fzf
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# ag
$ git clone git@github.com:JakeBecker/elixir-ls.git ~/elixir-ls
$ cd ~/elixir-ls
$ mix do deps.get, compile, elixir_ls.release -o release
$ sudo apt install silversearcher-ag
$ gem install solargraph
$ git clone git@github.com:thiamsantos/dotfiles.git /path/to/repo/dotfiles
$ ln -s /path/to/repo/dotfiles/vim/vimrc ~/.vimrc
$ mkdir -o ~/.vim
$ ln -s /path/to/repo/dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json
```

## Included plugins

- https://github.com/vim-airline/vim-airline
- https://github.com/terryma/vim-multiple-cursors
- https://github.com/airblade/vim-gitgutter
- https://github.com/tpope/vim-sensible
- https://github.com/tpope/vim-eunuch
- https://github.com/ntpeters/vim-better-whitespace
- https://github.com/vim-ctrlspace/vim-ctrlspace
- https://github.com/gosukiwi/vim-atom-dark

- https://github.com/neoclide/coc.nvim
- https://github.com/neoclide/coc-json
- https://github.com/JakeBecker/elixir-ls
- https://github.com/neoclide/coc-tsserver
- https://github.com/neoclide/coc-html
- https://github.com/neoclide/coc-css
- https://github.com/iamcco/coc-vimlsp
- https://github.com/amiralies/coc-flow
- https://github.com/neoclide/coc-yaml
- https://github.com/neoclide/coc-solargraph
- https://github.com/rcjsuen/dockerfile-language-server-nodejs
- https://github.com/neoclide/coc-sources

```
:CocInstall coc-json
:CocInstall coc-tsserver
:CocInstall coc-html
:CocInstall coc-css
:CocInstall coc-vimlsp
:CocInstall coc-flow
:CocInstall coc-yaml
:CocInstall coc-solargraph
:CocInstall coc-dictionary
:CocInstall coc-word
:CocInstall coc-omni
```
