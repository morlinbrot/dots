return {
    "tpope/vim-surround",   -- Add "surround editing" with "cs".
    "alvan/vim-closetag",   -- Auto-closing for xml tags.
    "airblade/vim-rooter",  -- Moves the cwd to the closest git repo root folder.

    {
        -- Fuzzy finding. Uses the fzf binary from Homebrew; the repo only provides the Vim plugin.
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf" },
        cmd = { "Files", "Buffers", "Lines", "Rg" },
        keys = {
            { "<leader>f", "<cmd>Files<CR>" },
            { "<leader>F", "<cmd>Files ~/<CR>" },
            { "<leader>b", "<cmd>Buffers<CR>" },
            { "<leader>l", "<cmd>Lines<CR>" },
            { "<leader>rg", "<cmd>Rg<CR>" },
        },
    },

    {
        "vimwiki/vimwiki",
        init = function()
            -- Use Markdown syntax.
            vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }
            -- Do not treat any .md file as wiki file.
            vim.g.vimwiki_global_ext = 0
        end,
    },

    {
        "hashivim/vim-terraform", -- Format on save for Terraform.
        ft = { "terraform", "hcl" },
        init = function() vim.g.terraform_fmt_on_save = 1 end,
    },
}
