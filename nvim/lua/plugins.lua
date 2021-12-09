local cmd = vim.cmd
local fn = vim.fn

-- Install packer.
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(vim.fn.glob(install_path)) > 0 then
  fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Run :PackerCompile whenever plugins.lua gets updated.
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Install plugins.
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'            -- Packer can manage itself.

    -- Adds :LspInstall command.
    use { 'williamboman/nvim-lsp-installer', requires = 'neovim/nvim-lspconfig' }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'onsails/lspkind-nvim',
            'L3MON4D3/LuaSnip',             -- nvim-cmp requires a snippet engine.
            'saadparwaiz1/cmp_luasnip',
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'   -- Inject non-LSP sources into the nvim's LSP interface.
    use 'tjdevries/lsp_extensions.nvim'     -- Enable inline hints.

    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- The latest & greatest in incremental tree parsing for highlighting, editing, and navigating code.
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional text objects for treesitter.
    use 'nvim-treesitter/playground'        -- Show the Treesitter tree with :TSPlaygroundToggle.

    use 'tmux-plugins/vim-tmux-focus-events'-- Activate focus events in emulators like tmux.
    use 'itchyny/lightline.vim'             -- Displays a line that shows what mode you're in.
    use 'numToStr/Comment.nvim'             -- Comment and un-comment with 'gc'.
    use 'editorconfig/editorconfig-vim'     -- Support for .editorconfig files.
    use 'chrisbra/Colorizer'                -- Colorise color strings, see <leader>cc keymap in init.vim.
    use 'alvan/vim-closetag'                -- Auto-closing for xml tags.
    use 'airblade/vim-rooter'               -- Moves the CL to the closest git repo root folder.
    use { 'junegunn/fzf', run = './install --all' }       -- ...using a fuzzy finder to quickly find files in the same dir.
    use 'junegunn/fzf.vim'
    use 'tpope/vim-surround'                -- Add "surround editing-- with "cs".
    use 'vimwiki/vimwiki'

    use 'hashivim/vim-terraform'            -- Needed for TF format on save. TODO: Replace with up to date alternative?

    -- Themes
    --use { 'dracula/vim',  as = 'dracula' }
    --"use { 'humanoid-colors/vim-humanoid-colorscheme', 'branch': 'main' }
    --"use 'arcticicestudio/nord-vim'
    use 'wadackel/vim-dogrun'               -- Needed for lightline.
    use { 'synul/githubsy.vim', branch = 'main' } -- What a fantastic colorscheme!

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

