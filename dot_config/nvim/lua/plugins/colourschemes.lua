-- colourscheme themes for nvim
-- tokyonight will be automatically loaded
-- can be changed with "<leader>C"
return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			local transparent = require("transparent")

			vim.keymap.set("n", "<leader>T", "<cmd>TransparentToggle<CR>", { desc = "Toggle [T]ransparency" })

			transparent.clear_prefix("Snacks")
			transparent.clear_prefix("WhichKey")
			transparent.clear_prefix("Blink")

			transparent.setup({
				extra_groups = {
					-- Standard floating windows (often used as fallback)
					"NormalFloat",
					"FloatBorder",
				},
				exclude_groups = { "CursorLine", "SnacksPickerListCursorLine", "SnacksPickerPreviewCursorLine", "BlinkCmpMenuSelection" },
			})
		end,
	},
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
			-- require("tokyonight").setup({
			-- 		transparent = true,
			-- 		styles = {
			-- 			sidebars = "transparent",
			-- 			floats = "transparent",
			-- 		},
			-- 	})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		-- onedark
		"olimorris/onedarkpro.nvim",
		-- config = function()
		-- 	require("onedark").setup({
		-- 		transparent = true,
		-- 	})
		-- end,
	},
	{
		-- catppuccin
		"catppuccin/nvim",
		-- config = function()
		-- 	require("catppuccin").setup({
		-- 		transparent_background = true,
		-- 		float = {
		-- 			transparent = true,
		-- 		},
		-- 	})
		-- end,
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"Mofiqul/dracula.nvim",
	},
	{
		"nvim-mini/mini.hues",
		version = false,
	},
}
