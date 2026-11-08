local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("config", { clear = true })

-- Highlight yanked text shortly.
autocmd("TextYankPost", {
    group = group,
    callback = function() vim.hl.on_yank({ timeout = 300 }) end,
})

-- Format on save.
autocmd("BufWritePre", {
    group = group,
    pattern = { "*.rs", "*.lua" },
    callback = function(args) vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 }) end,
})

-- LSP keymaps and inlay hints, for buffers with a language server attached.
autocmd("LspAttach", {
    group = group,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local function map(lhs, rhs, opts)
            vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", { buffer = args.buf }, opts or {}))
        end

        map("<A-CR>", vim.lsp.buf.hover)
        map("gd", vim.lsp.buf.definition)
        map("gD", vim.lsp.buf.declaration)
        map("<C-l>", vim.lsp.buf.implementation)
        map("<C-k>", vim.lsp.buf.signature_help)
        -- nowait: Neovim's own gr* defaults (grn rename, gra code action, ...) would delay this.
        map("gr", vim.lsp.buf.references, { nowait = true })
        map("g0", vim.lsp.buf.document_symbol)
        map("gW", vim.lsp.buf.workspace_symbol)
        map("ga", vim.lsp.buf.code_action)

        map("ge", vim.diagnostic.open_float)
        map("g[", function() vim.diagnostic.jump({ count = -1, float = true }) end)
        map("g]", function() vim.diagnostic.jump({ count = 1, float = true }) end)

        if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})
