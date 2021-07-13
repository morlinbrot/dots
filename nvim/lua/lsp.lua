local lspconfig = require'lspconfig'
local lspinstall = require'lspinstall'

lspinstall.setup()

-- https://users.rust-lang.org/t/how-to-disable-rust-analyzer-proc-macro-warnings-in-neovim/53150/6
local rust_config = {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
                disabled = {"unresolved-proc-macro"},
                enableexperimental = true,
            }
        }
    }
}

local lua_config = {
    settings = {
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
}

local function setup_servers()
    local servers = lspinstall.installed_servers()
    for _, server in pairs(servers) do
        local config = {}
        if server == 'lua' then
            config = lua_config
        end
        if server == 'rust' then
            config = rust_config
        end
        lspconfig[server].setup(config)
    end
end

setup_servers()

lspinstall.post_install_hook = function()
    setup_servers()
    vim.cmd('bufdo e')
end

-- Who even uses C# anymore...
-- local pid = vim.fn.getpid()
-- -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/opt/omnisharp/run"
-- -- on Windows
-- -- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
-- lspconfig.omnisharp.setup {
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
-- }

-- local configs = require'lspconfig/configs'
-- local util = require'lspconfig/util'
-- local server_name = 'omnisharp'

-- configs[server_name] = {
--   default_config = {
--     filetypes = {"cs", "vb"};
--     root_dir = util.root_pattern("*.csproj", "*.sln");
--     init_options = {
--     };
--   };
--   -- on_new_config = function(new_config) end;
--   -- on_attach = function(client, bufnr) end;
-- }
