local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 4
opt.number = true               -- Show line number on current line.
opt.relativenumber = true       -- Show relative line numbers.
opt.signcolumn = "yes"          -- Always show gutter (where errors are being displayed).
opt.undofile = true             -- Permanent undo (stored in ~/.local/state/nvim/undo).
opt.swapfile = false            -- Swap files are an annoyance mostly.
opt.wrap = false                -- Don't wrap long lines.
opt.timeoutlen = 400            -- Time to complete any key sequence.
opt.clipboard = "unnamedplus"   -- Simplify clipboard to p/P instead of "+p/P.
opt.ignorecase = true           -- Needs to be enabled for 'smartcase' to work.
opt.smartcase = true            -- Auto enable case sensitivity when query contains uppercase.
opt.cursorline = true           -- Highlight current line.
opt.splitbelow = true           -- Split new windows below.
opt.splitright = true           -- Vertically split new windows to the right.
opt.mouse = "a"                 -- Enable mouse support in all modes.
opt.scrolloff = 4               -- Keep some space around the cursor when hitting the edges.
opt.colorcolumn = "80,120"      -- Show a vertical line at the breakpoints.
opt.list = true
opt.listchars = { trail = "·" } -- Show trailing whitespace.
opt.showmode = false            -- Lightline shows the mode already.
opt.completeopt = "menuone,noselect"

-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.netrw_preview = 1

-- Diagnostics
vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,
})
