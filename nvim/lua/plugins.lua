local cmd = vim.cmd
local fn = vim.fn

-- Bootstrap packer using nvim's native package functionality.
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end

-- The `use` param is only here to appease the linter. It is actually being
-- injected into the function's scope.
return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'tpope/vim-surround'        -- Add "surround editing" with "cs".

end)
