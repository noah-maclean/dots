-- treesitter - basic language functionality such as highlighting using tree-sitter
return {
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	--        lazy = false,
	--        branch = "master",
	-- 	build = ":TSUpdate",
	-- 	config = function()
	-- 		local config = require("nvim-treesitter.configs")
	-- 		config.setup({
	-- 			auto_install = true,
	-- 			highlight = { enable = true },
	-- 			indent = { enable = true },
	-- 			ensure_installed = {
	-- 				"lua",
	-- 				"python",
	-- 				"c",
	-- 				"html",
	-- 				"css",
	-- 				"javascript",
	-- 				"markdown",
	-- 				"markdown_inline",
	-- 				"vim",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
	},
	{
        -- reinstates the previous treesitter functionality, like ensure installed, auto install, etc.
		"MeanderingProgrammer/treesitter-modules.nvim",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-modules").setup({
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
				-- auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				-- fold = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
        -- textobjects allows for more textobjects to be used than standard vim/nvim
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer", -- Select around function
						["if"] = "@function.inner", -- Select inner function
						["ac"] = "@class.outer", -- Select around class
						["ic"] = "@class.inner", -- Select inner class
					},
				},
			})
		end,
	},
	{
        -- context adds "sticky headers" for classes, functions, etc.
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = {
			enable = true,
			max_lines = 3,
		},
	},
}
