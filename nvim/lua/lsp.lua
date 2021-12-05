-- With inspiration from
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- -- -- -- -- -- -- --
-- Setup nvim-cmp.
-- -- -- -- -- -- -- --
local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require'lspkind'

vim.o.completeopt = 'menuone,noselect'

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50}),
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- -- -- -- -- -- -- --
-- Language specific settings
-- -- -- -- -- -- -- --
-- https://users.rust-lang.org/t/how-to-disable-rust-analyzer-proc-macro-warnings-in-neovim/53150/6
local rust_settings = {
    ["rust-analyzer"] = {
        diagnostics = {
            enable = true,
            disabled = {"unresolved-proc-macro"},
            enableexperimental = true,
        }
    }
}

local lua_settings = {
    Lua = {
        diagnostics = {
            globals = { 'vim' }
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    }
}

-- -- -- -- -- -- -- --
-- lsp_installer
-- -- -- -- -- -- -- --
local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(_, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == 'sumneko_lua' then
        opts.settings = lua_settings
    end
    if server.name == 'rust_analyzer' then
        opts.settings = rust_settings
    end

    opts.capabilities = capabilities
    opts.on_attach = on_attach

    -- Does the same as lsp_config's on_attach loop.
    server:setup(opts)
end)

