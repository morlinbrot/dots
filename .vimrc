" ++++ USAGE
" Create a $HOME/.config/nvim/.init.vim, containing
"
"    runtime ./path/to/this/.vimrc
"
" to use this file as a central rc for both vim and neovim.

" Before executing any of the vim-plug commands, we make sure that they exist.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Watch for changes to all variations of .vimrc files and auto-reload.
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" ++++ PLUGINS
" To install all plugins, run :PlugInstall
" To update plugins, run :PlugUpdate
" To update vim-plug iself, run :PlugUpgrade
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'        " Displays a line that shows what mode you're in.
Plug 'airblade/vim-rooter'          " Moves the CL to the nearest git repo root folder, useful for...
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
call plug#end()

colorscheme dracula
set background=dark

" ++++ LANGUAGE SERVER 
" Required for operations modifying multiple buffers like rename.
set hidden
" Automatically start language servers.
"let g:LanguageClient_autoStart = 1
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['ra_lsp_server'],
"    \ 'typescript': ['javascript-typescript-stdio'],
"    \ 'cpp': ['clangd'],
"    \ }
"let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
"set completefunc=LanguageClient#complete
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
"nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ++++ RUST
" Automatically format Rust files on save.
"let g:rustfmt_autosave = 1 

" ++++ KEY BINDINGS
let mapleader = "\<Space>"
" Double <leader> to open last opened buffer.
nnoremap <leader><leader> <c-^>
" Move lines up and down with Alt+k and Alt+j.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Resize windows.
map <A--> <C-w>-
map <A-+> <C-w>+
map <A-<> <C-w><
map <A->> <C-w>>
" Jump between windows.
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
" Shortcut resetting last search highlight.
nmap <leader>hl :noh<CR>
" FZF
map <leader>o :Files<CR>
map <leader>b :Buffer<CR>
map <leader>rg :Rg<CR>

" Map tab switching to Ctrl+Tab.
map <C-Tab> gt 
" Insert blank lines without entering insert mode
nmap <C-O> O<Esc>j
nmap <C-o> o<Esc>k
" Open netrw with F8 or <leader>8
map <F8> :Vex<CR>
map <leader>8 :Vex<CR>
" Source .vimrc
map <leader>s :source ~/.vimrc<CR>

" <Tab> and <S-Tab> to navigate autocompletion list.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" <CR> to confirm completion. 
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Double tap to Esc.
inoremap ii <Esc>
inoremap jk <Esc>

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_preview = 1

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab 
set number                  " Show line number on current line
set relativenumber          " Show relative line numbers
set signcolumn=yes          " Always show gutter (where errors are being displayed)
set hlsearch                " Highlight search terms
set undofile                " Permanent undo.
set undodir=~/.vim/undo
set nowrap                  " Don't wrap long lines
set timeoutlen=400          " Time to complete any key sequence
set clipboard=unnamedplus   " Simplfiy clipboard to p/P instead of "+p/P

