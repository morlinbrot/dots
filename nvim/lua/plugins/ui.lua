return {
    {
        "synul/githubsy.vim", -- What a fantastic colorscheme!
        branch = "main",
        lazy = false,
        priority = 1000, -- Load before everything else.
        config = function() pcall(vim.cmd.colorscheme, "githubsy") end,
    },
    {
        "itchyny/lightline.vim", -- Displays a line that shows what mode you're in.
        lazy = false,
        dependencies = { "wadackel/vim-dogrun" }, -- Provides the lightline colorscheme.
        init = function()
            -- Show the file path relative to the project root (vim-rooter sets the cwd to it).
            vim.cmd([[
                function! LightlineFilename()
                    return expand('%:~:.')
                endfunction
            ]])
            vim.g.lightline = {
                colorscheme = "dogrun",
                component_function = { filename = "LightlineFilename" },
            }
        end,
    },
    {
        "chrisbra/Colorizer", -- Colorise color strings.
        cmd = "ColorToggle",
        keys = { { "<leader>cc", "<cmd>ColorToggle<CR>", desc = "Toggle color highlight" } },
    },
}
