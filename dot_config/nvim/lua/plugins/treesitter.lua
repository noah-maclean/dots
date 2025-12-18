-- treesitter - basic language functionality such as highlighting using tree-sitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "master",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"lua",
					"python",
					"c",
					"html",
					"css",
					"javascript",
					"markdown",
					"markdown_inline",
					"vim",
				},
			})
		end,
	},
}
