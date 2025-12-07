-- colourscheme themes for nvim
-- tokyonight will be automatically loaded
-- can be changed with "<leader>C"
return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			local transparent = require("transparent")

			vim.keymap.set("n", "<leader>t", "<cmd>TransparentToggle<CR>", { desc = "Toggle [T]ransparency" })

			transparent.clear_prefix("Snacks")
			transparent.clear_prefix("WhichKey")

			transparent.setup({
				extra_groups = {
					-- Standard floating windows (often used as fallback)
					"NormalFloat",
					"FloatBorder",
				},
				exclude_groups = {  "SnacksPickerListCursorLine", "SnacksPickerPreviewCursorLine" },
			})

			-- vim.api.nvim_create_autocmd("ColorScheme", {
			-- 	pattern = "*",
			-- 	callback = function()
			-- 		transparent.clear_prefix("Snacks")
			-- 		transparent.clear_prefix("WhichKey")
			-- 		vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "Visual" })
			-- 		vim.api.nvim_set_hl(0, "SnacksPickerPreviewCursorLine", { link = "Visual" })
			-- 	end,
			-- })
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
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		-- onedark
		"navarasu/onedark.nvim",
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
}
