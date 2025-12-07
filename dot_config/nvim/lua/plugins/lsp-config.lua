-- mason, mason-lspconfig and nvim-lspconfig for "language intelligence tools" (highlighting, errors/warnings, completion, etc.)
-- mason - package manager for LSPs, DAPs, linters and formatters
-- mason-lspconfig - bridges mason and lspconfig to allow them to be used together, auto enables the lsp (calls vim.lsp.enable())
-- nvim-lspconfig - provides basic, default nvim lsp client config and links autocompletions

-- to get a new lsp working, install it with Mason and it should work automatically
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
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
				ensure_installed = { "ts_ls", "cssls", "lua_ls@3.15.0" }, -- keep lua_ls at this version to avoid breakage
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		config = function()
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
