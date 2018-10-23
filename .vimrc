" For vim, place a .vimrc file containing
"   runtime ./vimrc
" in your home folder.
" For nvim, place an init.vim file containing
"
" under $HOME/.configs/nvim.

" VIM-PLUG
" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" NERDTree on demand
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Rust plugin
Plug 'rust-lang/rust.vim'
" Dracula color scheme
Plug 'dracula/dracula-theme'

" Initialize plugin system
call plug#end()

" NERDTree config
" Toggle tree with Ctrl+N
map <F9> : NERDTreeToggle<CR>

" Map tab switching to Ctrl+Tab
:map <C-Tab> gt 

" Show line numbers
set number

" Font size
:set guifont=Monospace\ 13 

" Tab settings
:set expandtab
:set tabstop=2
:set shiftwidth=2

" Highlight search terms
:set hlsearch

" Set cli colors
colorscheme candy

" gvim (different color scheme)
if has('gui_running')
  set guioptions-=T " no toolbar
  colorscheme dracula
endif
