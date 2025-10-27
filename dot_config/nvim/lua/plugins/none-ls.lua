-- none-ls (null-ls maintained by community) - injects lsp diagnostics, code actions, etc. to nvim
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- install the linter/formatter in Mason to ensure it works

				-- formatting:
				-- stylua (lua)
				null_ls.builtins.formatting.stylua,
				-- prettier (html, css, js,etc)
				null_ls.builtins.formatting.prettier,
				-- black (python)
				null_ls.builtins.formatting.black,
				-- isort (python imports)
				null_ls.builtins.formatting.isort,

				-- completions:
				null_ls.builtins.completion.spell,

				-- diagnostics:
				-- eslint (js, ts)
				require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

		-- "<leader>cf" calls the format for the lsp client (formats the file)
		-- vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
