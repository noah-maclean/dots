-- colourscheme themes for nvim
-- tokyonight will be automatically loaded
-- can be changed with "<leader>C"
return {
	{
		-- tokyonight
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- transparent = true,
			-- styles = {
			--     sidebars = "transparent",
			--     floats = "transparent",
			-- },
		},
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		-- onedark
		"navarasu/onedark.nvim",
	},
	{
		-- catppuccin
		"catppuccin/nvim",
	},
}
