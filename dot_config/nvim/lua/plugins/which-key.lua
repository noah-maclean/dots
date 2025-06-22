-- which-key to show available keymaps
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = " find files" }, -- shows leader f to be the file keybinds
			{ "<leader>c", group = " code" }, -- shows leader c to be the code keybinds
			{ "<leader>b", group = " buffer" }, -- shows leader b to be the buffer keybinds
			{ "<leader>g", group = " git" }, -- shows leader g to be the git keybinds
			{ "<leader>s", group = " search" }, -- shows leader s to be the search keybinds
			{ "<leader>u", group = " hide" }, -- shows leader u to be the hide keybinds
			{ "<leader>p", group = " fun!" }, -- shows leader p to be the fun keybinds
			{ "<leader>pd", group = " ducks" }, -- shows leader pd to be the duck keybinds
		})
        wk.setup({
            -- preset options are classic, modern and helix
            preset = "helix",
        })
	end,
}
