-- mason, mason-lspconfig and nvim-lspconfig for "language intelligence tools" (highlighting, errors/warnings, completion, etc.)
-- mason - package manager for LSPs, DAPs, linters and formatters
-- mason-lspconfig - bridges mason and lspconfig to allow them to be used together
-- nvim-lspconfig - provides basic, default nvim lsp client config and links autocompletions

-- to get a new lsp working, install it with Mason and it should work automatically
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "saghen/blink.cmp" },
        lazy = false,
        opts = {},
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,
                -- ensure the following lsps are installed
                -- lua_ls for lua
                -- ts_ls for javascript (typescript)
                -- cssls for css
                ensure_installed = { "lua_ls", "ts_ls", "cssls" },
            })

            -- let completions use the lsp data
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")

            -- setup_handlers will automatically configure installed language servers (not completely sure how it works)
            require("mason-lspconfig").setup_handlers({
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have a dedicated handler.

                -- i think this should setup completions for all installed LSPs on mason
                function(server) -- default handler
                    lspconfig[server].setup({ capabilities = capabilities })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        lazy = false,
        config = function()
            -- -- let completions use the lsp data
            -- local capabilities = require("blink.cmp").get_lsp_capabilities()
            -- local lspconfig = require("lspconfig")

            -- -- enter the lsp here for proper autocompletions (done above in mason so its hopefully automatic)
            -- lspconfig.lua_ls.setup({ capabilities = capabilities })
            -- lspconfig.ts_ls.setup({ capabilities = capabilities })
            -- lspconfig.cssls.setup({ capabilities = capabilities })

            -- "K" displays hover information about the symbol under the cursor
            -- "KK" will jump to that window
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            -- go to definition, references and others have been defined in snacks.lua to use the picker to search

            -- "gd" will go to where the object under cursor is defined
            -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            -- "gr" will go to the references to the object
            -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
            -- "<leader>ca" will give a list of code actions for that line
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })
            -- "<leader>cd" will show the diagnostic message on that line
            vim.keymap.set({ "n", "v" }, "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
        end,
    },
}
