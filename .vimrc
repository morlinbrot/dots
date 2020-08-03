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
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc ++nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" ++++ PLUGINS
" To install all plugins, run :PlugInstall
" To update plugins, run :PlugUpdate
" To update vim-plug iself, run :PlugUpgrade
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'            " Displays a line that shows what mode you're in.
Plug 'machakann/vim-highlightedyank'    " Highlight what you're yanking
Plug 'airblade/vim-rooter'              " Moves the CL to the closest git repo root folder
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

colorscheme dracula
let g:lightline = { 'colorscheme': 'dracula' }


" ++++ GENERAL SETTINGS
set hidden                  " Enable multiple buffers being opened in the background
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
set smartcase               " Auto enable case sensitivity when query contains uppercase
set cursorline              " Highlight current line

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
map <leader>O :Files ~/<CR>
map <leader>p :Files ~/prx<CR>
map <leader>b :Buffer<CR>
map <leader>rg :Rg<CR>
" Always show the preview window.
let g:fzf_preview_window = 'right:60%' 

" Map tab switching to Ctrl+Tab.
map <C-Tab> gt 
" Insert blank lines without entering insert mode
nmap <M-O> O<Esc>j
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
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_preview = 1

" COC.NVIM
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

