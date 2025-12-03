-- which-key to show available keymaps
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- preset options are classic, modern and helix
		preset = "helix",
		spec = {
			{
				mode = { "n", "x" },
				{ "<leader>f", group = " find files" }, -- shows leader f to be the file keybinds
				{ "<leader>c", group = " code" }, -- shows leader c to be the code keybinds
				{ "<leader>g", group = " git" }, -- shows leader g to be the git keybinds
				{ "<leader>s", group = " search" }, -- shows leader s to be the search keybinds
				{ "<leader>u", group = " hide" }, -- shows leader u to be the hide keybinds
				{ "<leader>p", group = " fun!", icon = "" }, -- shows leader p to be the fun keybinds
				{ "<leader>m", group = " markdown", icon = "" }, -- shows leader m to be the markdown keybinds
				{ "<leader>t", group = " markdown table", icon = "" }, -- shows leader t to be the markdown table keybinds
				{ "<leader>h", group = " markdown headings", icon = "󰰀" },
				{ "<leader>mf", group = " markdown footnotes" },
				{ "<leader>mQ", group = " markdown quotes" },
				{ "<leader>pd", group = " ducks", icon = "󰇥" }, -- shows leader pd to be the duck keybinds
			},
		},
	},

	-- config = function()
	-- 	local wk = require("which-key")
	-- 	wk.add({
	-- 		{ "<leader>f", group = " find files" }, -- shows leader f to be the file keybinds
	-- 		{ "<leader>c", group = " code" }, -- shows leader c to be the code keybinds
	-- 		{ "<leader>g", group = " git" }, -- shows leader g to be the git keybinds
	-- 		{ "<leader>s", group = " search" }, -- shows leader s to be the search keybinds
	-- 		{ "<leader>u", group = " hide" }, -- shows leader u to be the hide keybinds
	-- 		{ "<leader>p", group = " fun!", icon = "" }, -- shows leader p to be the fun keybinds
	-- 		{ "<leader>m", group = " markdown", icon = "" }, -- shows leader m to be the markdown keybinds
	-- 		{ "<leader>t", group = " markdown table", icon = "" }, -- shows leader t to be the markdown table keybinds
	-- 		{ "<leader>h", group = " markdown headings", icon = "󰰀" },
	-- 		{ "<leader>mf", group = " markdown footnotes" },
	-- 		{ "<leader>mQ", group = " markdown quotes" },
	-- 		{ "<leader>pd", group = " ducks", icon = "󰇥" }, -- shows leader pd to be the duck keybinds
	-- 	})
	-- 	wk.setup({
	-- 		-- preset options are classic, modern and helix
	-- 		preset = "helix",
	-- 	})
	-- end,
}
