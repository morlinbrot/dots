-- nvim-treesitter's `main` branch: parsers are compiled with the tree-sitter CLI
-- (brew "tree-sitter-cli"), highlighting and indentation are turned on per buffer below.
local parsers = {
    "bash", "css", "go", "html", "javascript", "json", "lua", "markdown",
    "markdown_inline", "python", "query", "rust", "terraform", "toml", "tsx",
    "typescript", "vim", "vimdoc", "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
                callback = function(args)
                    -- Fails quietly when there's no parser for this filetype.
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true }, -- Automatically jump forward to textobj, similar to targets.vim.
                move = { set_jumps = true },
            })

            local select = require("nvim-treesitter-textobjects.select")
            for keys, query in pairs({
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }) do
                vim.keymap.set({ "x", "o" }, keys, function()
                    select.select_textobject(query, "textobjects")
                end)
            end

            local move = require("nvim-treesitter-textobjects.move")
            for fn, maps in pairs({
                goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
                goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
                goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
                goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
            }) do
                for keys, query in pairs(maps) do
                    vim.keymap.set({ "n", "x", "o" }, keys, function()
                        move[fn](query, "textobjects")
                    end)
                end
            end
        end,
    },
}
