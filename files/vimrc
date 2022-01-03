" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()

colorscheme dracula

" Switch syntax highlighting on
syntax on

" Use 2 spaces instead of tabs
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Use colors that look good on a dark background
set background=dark

" Absolute line numbers
set nu

" Store swap file elsewhere
set directory=$HOME/.vim/swp//

" Disable backup files
set nobackup
set nowritebackup

" Enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Highlight search
set hlsearch

" Break line in convenient places
set linebreak

" Enable airline tabline
let g:airline#extensions#tabline#enabled = 1

" Enable persistent undo
set undofile
set undodir=~/.vim/undodir

" Centralize matches of search
nnoremap n nzz
nnoremap N Nzz

" Split right and below
set splitright
set splitbelow

" make . to work with visually selected lines
vnoremap . :normal.<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Map :w!! to write with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
