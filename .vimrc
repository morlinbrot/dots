"jiangmiao/auto-pairs Create a $HOME/.vimrc, containing
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

" # ++++ # ++++ #
"  PLUGINS
" # ++++ # ++++ #
" Before executing any of the vim-plug commands, we make sure that they exist.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install all plugins, run :PlugInstall
" To update plugins, run :PlugUpdate
" To update vim-plug iself, run :PlugUpgrade
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" v2 of the nvim-completion-manager.
Plug 'ncm2/ncm2'
" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'
" Completion plugins
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Syntax checker, dependency of RustFmt
Plug 'vim-syntastic/syntastic'

" Autocomplete matching pairs while typing.
Plug 'jiangmiao/auto-pairs'
" Provides a file explorer sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Dracula color scheme
Plug 'dracula/vim', {'as': 'dracula'}
" Displays a line that shows what mode you're in.
Plug 'itchyny/lightline.vim'
" Adds a gutter to the editor, displaying errors etc.
Plug 'w0rp/ale'

" FZF FUZZY FINDER
" Moves the CL to the nearest git repo root folder, useful for...
Plug 'airblade/vim-rooter'
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


call plug#end()


" # ++++ # ++++ #
"  LANGUAGE SERVER 
" # ++++ # ++++ #
" Required for operations modifying multiple buffers like rename.
set hidden
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
" Automatically activate ncm2 in all buffers.
autocmd BufEnter  *  call ncm2#enable_for_buffer()

" Automatically format Rust files on save.
let g:rustfmt_autosave = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" Autocompletion
set completeopt=noinsert,menuone,noselect
" tab to select and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")


" # ++++ # ++++ #
"  KEY BINDINGS
" # ++++ # ++++ #
" Double <leader> to open last opened file.
nnoremap <leader><leader> <c-^>
" Ctrl+j as Esc.
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
" Paste from system clipboard.
nmap <leader> "*p
" Shortcut resetting last search highlight.
nmap <leader>hl :noh<CR>
" FZF
map <leader>o :Files<CR>
map <leader>b :Buffer<CR>
" Toggle NERDTree with F8.
map <F8> :NERDTreeToggle<CR>
map <leader>8 :NERDTreeToggle<CR>
" Map tab switching to Ctrl+Tab.
map <C-Tab> gt 
" Insert blank lines without entering insert mode
nmap <C-O> O<Esc>j
nmap <C-o> o<Esc>k

" # ++++ # ++++ #
"  GENERAL SETTINGS
" # ++++ # ++++ #
" Tab settings
:set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 

" Show line numbers
set number
" Font size
:set guifont=Monospace\ 13 
" Highlight search terms
:set hlsearch
" Permanent undo.
set undodir=~/.vim/undo
set undofile

" Set cli colors
silent! colorscheme dracula
