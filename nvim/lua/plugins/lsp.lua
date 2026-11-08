-- Language servers are installed with Homebrew (see setup/Brewfile*) or rustup
-- (rust-analyzer), not from inside Neovim. Servers that aren't installed are skipped.
local servers = {
    rust_analyzer = "rust-analyzer",
    lua_ls = "lua-language-server",
    gopls = "gopls",
    pyright = "pyright-langserver",
    yamlls = "yaml-language-server",
    zls = "zls",
}

return {
    {
        -- Provides the default config for each server; we only add our own settings on top.
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                            disabled = { "unresolved-proc-macro" },
                            enableExperimental = true,
                        },
                    },
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        -- Make the server aware of Neovim runtime files.
                        workspace = { library = { vim.env.VIMRUNTIME } },
                    },
                },
            })

            for server, bin in pairs(servers) do
                if vim.fn.executable(bin) == 1 then
                    vim.lsp.enable(server)
                end
            end
        end,
    },
}
