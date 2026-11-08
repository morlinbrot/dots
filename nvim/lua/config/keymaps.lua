-- General keymaps. LSP keymaps are set per buffer in config/autocmds.lua,
-- plugin keymaps next to their plugin in lua/plugins/.
local map = vim.keymap.set

-- Double <leader> to open last opened buffer.
map("n", "<leader><leader>", "<C-^>")

-- Ergonomic Esc alternative.
map({ "i", "v" }, "<C-j>", "<Esc>")

-- Move lines up and down with Alt+j and Alt+k (in normal mode, Alt+j/k jump between windows).
map("i", "<A-j>", "<Esc>:m .+1<CR>==", { silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==", { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Disable godforsaken Ex mode.
map("n", "Q", "<Nop>")

-- Resize windows.
map("n", "<A-->", "<C-w>-")
map("n", "<A-+>", "<C-w>+")
map("n", "<A-<>", "<C-w><")
map("n", "<A->>", "<C-w>>")

-- Jump between windows.
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- *C*onfig *O*pen.
map("n", "<leader>co", "<cmd>edit $MYVIMRC<CR>")

-- Keymaps for constant twitchy saving after each change (same as in Helix).
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>x", "<cmd>x<CR>")
map("n", "<leader>q", "<cmd>q<CR>")

-- Reset last search highlight.
map("n", "<leader>hl", "<cmd>nohlsearch<CR>")

-- Delete without yanking (dumps into the black hole register).
map({ "n", "v" }, "<leader>d", '"_d')

-- Paste over a selection without yanking the replaced text.
map("x", "p", "P")

-- Tab switching with Ctrl+Tab.
map("n", "<C-Tab>", "gt")

-- Open netrw with F8 or <leader>8.
map("n", "<F8>", "<cmd>Vex<CR>")
map("n", "<leader>8", "<cmd>Vex<CR>")

-- Don't jump to next occurrence when using 'super star'.
map("n", "*", "*<C-o>")

-- Show the treesitter captures/highlight groups under the cursor.
map("n", "<leader>ss", "<cmd>Inspect<CR>")
