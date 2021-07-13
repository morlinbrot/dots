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
" Adds :PlugInstall, :PlugUpdate, :PlugUpgrade, :PlugClean commands.
call plug#begin('~/.vim/plugged')
Plug 'tmux-plugins/vim-tmux-focus-events' " Activate focus events in emulators like tmux.
Plug 'itchyny/lightline.vim'            " Displays a line that shows what mode you're in.
Plug 'tpope/vim-commentary'             " Comment and un-comment with 'gc'.
Plug 'editorconfig/editorconfig-vim'    " Support for .editorconfig files.
Plug 'chrisbra/Colorizer'               " Colorise color strings, see <leader>cc keymap below.
Plug 'alvan/vim-closetag'               " Auto-closing for xml tags.
Plug 'airblade/vim-rooter'              " Moves the CL to the closest git repo root folder.
" ...using a fuzzy finder to quickly find files in the same dir.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'                 " Auto-formatting for various languages.
Plug 'vimwiki/vimwiki'
" Nvim LSP goodness
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall', { 'branch': 'main' }        " Add a :LspInstall command.
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter, update parsers on update.

Plug 'nvim-lua/completion-nvim'

" Themes
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wadackel/vim-dogrun'
"Plug 'joshdick/onedark.vim'
"Plug 'humanoid-colors/vim-humanoid-colorscheme', { 'branch': 'main' }
"Plug 'arcticicestudio/nord-vim'
Plug 'synul/githubsy.vim', { 'branch': 'main' }

call plug#end()

colorscheme githubsy

lua <<EOF
require'config'
require'lsp'
require'netrw'
require'treesitter'
EOF


" ++++ GENERAL SETTINGS
set hidden                  " Allow multiple buffers to be open without saving.
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set number                  " Show line number on current line.
set relativenumber          " Show relative line numbers.
set signcolumn=yes          " Always show gutter (where errors are being displayed).
set hlsearch                " Highlight search terms.
set undofile                " Permanent undo.
set undodir=~/.vim/undo
set nowrap                  " Don't wrap long lines.
set timeoutlen=400          " Time to complete any key sequence.
set clipboard=unnamedplus   " Simplify clipboard to p/P instead of "+p/P.
set ignorecase              " Needs to be enabled for 'smartcase' to work.
set smartcase               " Auto enable case sensitivity when query contains uppercase.
set cursorline              " Highlight current line.
set autoread                " Automatically refresh file buffers.
set splitbelow              " Split new windows below.
set splitright              " Vertically split new windows to the right.
set mouse=a                 " Enable mouse support in all mode.
set scrolloff=4             " Keep some space around the cursor when hitting the edges.
set colorcolumn=80,120      " Show a vertical line at the breakpoints.

" ++++ KEY BINDINGS
let mapleader = "\<Space>"
" Double <leader> to open last opened buffer.
nnoremap <leader><leader> <c-^>
" Ergonomic Esc alternative.
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
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
map <leader>q :q<CR>
" Shortcut resetting last search highlight.
nmap <leader>hl :noh<CR>
" FZF
map <leader>o :Files<CR>
map <leader>O :Files ~/<CR>
map <leader>p :Files ~/prx<CR>
map <leader>b :Buffer<CR>
map <leader>rg :Rg<CR>
" Delete without yanking (dumps into the black hole register).
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" Overwrite annoying 'yank when putting' behaviour.
vnoremap p "_dP
" Map tab switching to Ctrl+Tab.
map <C-Tab> gt
" Open netrw with F8 or <leader>8.
map <F8> :Vex<CR>
map <leader>8 :Vex<CR>
" Source vimrc.
map <leader>s :source ~/.vimrc<CR>
" Toggle color highlight.
nnoremap <leader>cc :ColorToggle<CR>
" Don't jump to next occurrence when using 'super star'.
nnoremap * *<c-o>

" Always show the preview window.
let g:fzf_preview_window = 'right:60%'

" ++++ TAB COMPLETION
" https://github.com/nvim-lua/completion-nvim
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu.
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience.
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion.
set shortmess+=c


" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
    \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }


" Trigger `autoread` when files change on disk.
" Needs ':set autoload' in .vimrc and 'set -g focus-events on' in .tmux.conf
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Handy function to show the highlight group of the item under the cursor.
nnoremap <leader>ss :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ++++ LIGHTLINE CONFIG
let g:lightline = {
    \ 'colorscheme': 'dogrun',
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ }
    \ }

" Prepend filename with path to project root.
" See https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction

" ++++ VIM-CLOSETAG CONFIG
" Activate for following filetypes.
let g:closetag_filenames = '*.html,*.xml,*.jsx,*.tsx'
" Make non-closing tags self-closing in these filetypes.
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.tsx'
" Disables auto-close if not in a 'valid' region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Make auto-closing case sensitive, e.g. <Link></Link> vs <link />
let g:closetag_emptyTags_caseSensitive = 1
"
let g:closetag_shortcut = '>'

" ++++ AUTO-FORMATTING
" Auto-format on save.
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

" Always run all formatters found.
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_typescript = ['prettier', 'eslint', 'prettier-eslint']
let g:neoformat_enabled_typescriptreact = ['prettier', 'eslint', 'prettier-eslint']

" VimWiki
" Use Markdown syntax.
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'}]
" Do not treat any .md file as wiki file.
let g:vimwiki_global_ext = 0

