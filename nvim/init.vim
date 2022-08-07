lua <<EOF
require'plugins'
require'config'
require'lsp'
require'netrw'
require'treesitter'
EOF

" ++++ GENERAL SETTINGS
set hidden                  " Still here for backwards compatibility.
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
set noswapfile              " Swap files are an annoyance mostly.
set list
set listchars=trail:·       " Show trailing whitespace.

" +++ KEY BINDINGS
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
" Disable godforsaken Ex mode
map Q <Nop>
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

" Quick config editing.
" Should use $XDG_CONFIG_HOME but that does not get set right now...
" *C*onfig *O*pen
nnoremap <leader>co :e $HOME/.config/nvim/init.vim<CR>
" *So*urce config.
map <leader>so :so ~/.config/nvim/init.vim<CR>

" Keymap for constant twitchy saving after each change.
map <leader>w :w<CR>
map <leader>wq :wq<CR>
map <leader>q :q<CR>
" Shortcut resetting last search highlight.
nmap <leader>hl :noh<CR>
" FZF
map <leader>f :Files<CR>
map <leader>F :Files ~/<CR>
map <leader>b :Buffer<CR>
map <leader>l :Lines<CR>
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
" Toggle color highlight.
nnoremap <leader>cc :ColorToggle<CR>
" Don't jump to next occurrence when using 'super star'.
nnoremap * *<c-o>
" Show the capture groups of item under the cursor.
nnoremap <leader>ss :TSHighlightCapturesUnderCursor<CR>

" Format-on-save functionality.
autocmd BufWritePre *.rs,*.lua lua vim.lsp.buf.formatting_sync(nil, 200)
" Show inline hints provided by lsp_extensions.
autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}

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

" VimWiki
" Use Markdown syntax.
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'}]
" Do not treat any .md file as wiki file.
let g:vimwiki_global_ext = 0

" Terraform auto save.
let g:terraform_fmt_on_save = 1
