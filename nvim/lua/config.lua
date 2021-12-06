-- Keep transitioning settings from init.vim to eventually use this as init.lua
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

require'Comment'.setup()

-- Highlight yanked text shortly.
cmd 'au TextYankPost * lua vim.highlight.on_yank { timeout = 300 }'

local function map(mode, lhs, rhs, opts)
    local defaults = { noremap = true, silent = true }
    local options = opts and setmetatable(opts, { _index = defaults }) or defaults
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(...) map('n', ...) end
-- local function imap(...) map('i', ...) end
-- local function vmap(...) map('v', ...) end

nmap('<a-cr>', '<cmd>lua vim.lsp.buf.hover()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('<c-l>', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nmap('<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nmap('gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
nmap('gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')

nmap('ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
-- Goto previous/next diagnostic warning/error
nmap('g[', '<cmd>vim.lsp.diagnostic.goto_prev()<cr>')
nmap('g}', '<cmd>vim.lsp.diagnostic.goto_next()<cr>')


cmd('silent! colorscheme githubsy')

g.lightline = {
    colorscheme = 'dogrun',
    component_function = {
        filename = 'LightlineFilename',
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
        severity_sort = true,
    }
)
