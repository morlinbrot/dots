" Create a $HOME/.vimrc, containing
"    runtime ./path/to/this/.vimrc
"
" and/or
"
" Create a $HOME/.configs/nvim/.init.vim, containing
"    set runtimepath^=~/.vim runtimepath+=~/.vim/after
"    let &packpath = &runtimepath
"    source ~/configs/.vimrc
"    source ~/configs/.nvimrc
" to use this file as a central rc for both vim and neovim.

" A lot of inspiration came from:
" https://github.com/jonhoo/configs/blob/master/.vimrc

let mapleader = "\<Space>"

" VIM-PLUG
" To install all plugins, run :PlugInstall
" To update plugins, run :PlugUpdate
" To update vim-plug iself, run :PlugUpgrade
call plug#begin('~/.vim/plugged')

" Rust. 
Plug 'rust-lang/rust.vim'

" Provides a file explorer sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Dracula color scheme
Plug 'dracula/vim', {'as': 'dracula'}
" Displays a line that shows what mode you're in.
Plug 'itchyny/lightline.vim'
" Adds a gutter to the editor, displaying errors etc.
Plug 'w0rp/ale'
" Use autocompletion
Plug 'ncm2/ncm2'

" FZF FUZZY FINDER
" Moves the CL to the nearest git repo root folder, useful for...
Plug 'airblade/vim-rooter'
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" KEY BINDINGS
" Double <leader> to open last opened file.
nnoremap <leader><leader> <c-^>
" Paste from system clipboard.
nmap <leader> "*p
" Shortcut resetting last search highlight.
nmap <leader>hl :noh<CR>
" Use fzf to open files.
map <leader>o :Files<CR>
" Toggle NERDTree with Ctrl+N.
map <F9> :NERDTreeToggle<CR>
" Map tab switching to Ctrl+Tab.
map <C-Tab> gt 


" GENERAL SETTINGS
" Tab settings
:set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 

" Show line numbers
set number
" Font size
:set guifont=Monospace\ 13 
" Highlight search terms
:set hlsearch

" Set cli colors
silent! colorscheme dracula
