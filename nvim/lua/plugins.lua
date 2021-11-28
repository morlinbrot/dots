local cmd = vim.cmd
local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

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

    -- Adds :LspInstall command.
    use {
        'williamboman/nvim-lsp-installer',
        requires = 'neovim/nvim-lspconfig'
    }
    use 'tjdevries/lsp_extensions.nvim'

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

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Treesitter, update parsers on update.
    use 'nvim-treesitter/playground'        -- Show the Treesitter tree with :TSPlaygroundToggle.

    use 'tmux-plugins/vim-tmux-focus-events'-- Activate focus events in emulators like tmux.
    use 'itchyny/lightline.vim'             -- Displays a line that shows what mode you're in.
    use 'tpope/vim-commentary'              -- Comment and un-comment with 'gc'.
    use 'editorconfig/editorconfig-vim'     -- Support for .editorconfig files.
    use 'chrisbra/Colorizer'                -- Colorise color strings, see <leader>cc keymap in init.vim.
    use 'alvan/vim-closetag'                -- Auto-closing for xml tags.
    use 'airblade/vim-rooter'               -- Moves the CL to the closest git repo root folder.
    use { 'junegunn/fzf', run = './install --all' }       -- ...using a fuzzy finder to quickly find files in the same dir.
    use 'junegunn/fzf.vim'
    use 'tpope/vim-surround'                -- Add "surround editing-- with "cs".
    use 'vimwiki/vimwiki'

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

