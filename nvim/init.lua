-- Leader must be set before lazy.nvim loads plugins, so their mappings pick it up.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- ++++ lazy.nvim (installs itself on first start)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error("Failed to clone lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specs live in lua/plugins/*.lua.
require("lazy").setup({
    spec = { { import = "plugins" } },
    install = { colorscheme = { "githubsy", "habamax" } },
    change_detection = { notify = false },
})
