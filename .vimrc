" For vim, place a .vimrc file containing
"     runtime ./vimrc
" in your home folder.
"
" For nvim, place an init.vim file containing
"    set runtimepath^=~/.vim runtimepath+=~/.vim/after
"    let &packpath = &runtimepath
"    source ~/configs/.vimrc
"    source ~/configs/.nvimrc
" under $HOME/.configs/nvim.

" A lot of useful stuff may be found here:
" https://github.com/jonhoo/configs/blob/master/.vimrc
let mapleader = "\<Space>"

" VIM-PLUG
" To install all plugins, run :PlugInstall +qall
" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" NERDTree on demand
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Rust plugin
Plug 'rust-lang/rust.vim'
" Dracula color scheme
Plug 'dracula/dracula-theme'
" Displays a line that shows what mode you're in.
Plug 'itchyny/lightline.vim'
" Adds a gutter to the editor, displaying errors etc.
Plug 'w0rp/ale'
" Use autocompletion
Plug 'ncm2/ncm2'

" Fuzzy finder
" Moves the CL to the nearest git repo root folder.
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" KEY BINDINGS
" Double <leader> to open last opened file
nnoremap <leader><leader> <c-^>
" Use fzf to open files
map <leader>o :Files<CR>
" Paste from system clipboard
nmap <leader> "*p
" Toggle NERDTree with Ctrl+N
map <F9> :NERDTreeToggle<CR>
" Map tab switching to Ctrl+Tab
:map <C-Tab> gt 

" Show line numbers
set number

" Font size
:set guifont=Monospace\ 13 

" Tab settings
:set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 

" Highlight search terms
:set hlsearch

" Set cli colors
colorscheme dracula
