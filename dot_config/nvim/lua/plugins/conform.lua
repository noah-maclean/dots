return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
			},
			-- format_on_save = {
			-- 	-- These options will be passed to conform.format()
			-- 	timeout_ms = 500,
			-- 	lsp_format = "fallback",
			-- },
			-- vim.keymap.set("n", "<leader>cf", conform.format(), { desc = "Format file" })
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({
				lsp_fallback = true,
				-- lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file" })
	end,
}
