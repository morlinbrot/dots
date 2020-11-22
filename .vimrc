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
Plug 'tmux-plugins/vim-tmux-focus-events' " Activate focus events in emulators like tmux.
Plug 'rust-lang/rust.vim'               " Rust plugin to enable auto formatting etc.
Plug 'itchyny/lightline.vim'            " Displays a line that shows what mode you're in.
Plug 'machakann/vim-highlightedyank'    " Highlight what you're yanking
Plug 'airblade/vim-rooter'              " Moves the CL to the closest git repo root folder
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Nvim LSP goodness
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'editorconfig/editorconfig-vim'
" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'arcticicestudio/nord-vim'
"Plug 'bignimbus/pop-punk.vim'
"Plug 'tomasr/molokai'
call plug#end()

" Run rustfmt on save.
let g:rustfmt_autosave = 1

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
set ignorecase              " Needs to be enabled for 'smartcase' to work
set smartcase               " Auto enable case sensitivity when query contains uppercase
set cursorline              " Highlight current line
set autoread                " Automatically refresh file buffers

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
" Keymap for constant twitchy saving after each change.
map <leader>w :w<CR>
map <leader>wq :wq<CR>
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
" Open netrw with F8 or <leader>8
map <F8> :Vex<CR>
map <leader>8 :Vex<CR>
" Source .vimrc
map <leader>s :source ~/.vimrc<CR>

" Tab completion setup stolen from Jon Gjengset
" <Tab> and <S-Tab> to navigate autocompletion list.
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"" <CR> to confirm completion. 
"inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" ++++ LSP CONFIG
" Following https://sharksforarms.dev/posts/neovim-rust/
set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'nvim_lsp'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

EOF

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

" Code navigation shortcuts
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
" ++++ END LSP CONFIG

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

" Triger `autoread` when files changes on disk
" Needs ':set autoload' in .vimrc and 'set -g focus-events on' in .tmux.conf
" in .tmux.conf
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

