local cmd = vim.cmd
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Run :PackerCompile whenever plugins.lua gets updated.
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

cmd('silent! colorscheme githubsy')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'            -- Packer can manage itself.

  use 'tmux-plugins/vim-tmux-focus-events'-- Activate focus events in emulators like tmux.
  use 'itchyny/lightline.vim'             -- Displays a line that shows what mode you're in.
  use 'tpope/vim-commentary'              -- Comment and un-comment with 'gc'.
  use 'editorconfig/editorconfig-vim'     -- Support for .editorconfig files.
  use 'chrisbra/Colorizer'                -- Colorise color strings, see <leader>cc keymap below.
  use 'alvan/vim-closetag'                -- Auto-closing for xml tags.
  use 'airblade/vim-rooter'               -- Moves the CL to the closest git repo root folder.
  use { 'junegunn/fzf', run = './install --all' }       -- ...using a fuzzy finder to quickly find files in the same dir.
  use 'junegunn/fzf.vim'
  use 'sbdchd/neoformat'                  -- Auto-formatting for various languages.
  use 'tpope/vim-surround'                -- Add "surround editing-- with "cs".
  use 'vimwiki/vimwiki'

  use 'neovim/nvim-lspconfig'
  use { 'kabouzeid/nvim-lspinstall', branch = 'main' }  -- Add a :LspInstall command.
  use 'tjdevries/lsp_extensions.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets.
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Treesitter, update parsers on update.
  use 'nvim-treesitter/playground'

  -- Themes
  --use { 'dracula/vim',  as = 'dracula' }
  --"use 'joshdick/onedark.vim'
  --"use { 'humanoid-colors/vim-humanoid-colorscheme', 'branch': 'main' }
  --"use 'arcticicestudio/nord-vim'
  use 'wadackel/vim-dogrun'               -- Needed for lightline.
  use { 'synul/githubsy.vim', branch = 'main' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

