-- outline - show outline of headings, function, variables, etc.
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline!<CR>", desc = "Toggle [O]utline" },
		{ "<leader>O", "<cmd>Outline<CR>", desc = "Toggle [O]utline and focus)" },
	},
	opts = {
		outline_window = {
			show_cursorline = true,
			hide_cursor = true,
		},
		width = 25,
		auto_width = {
			enabled = true,
			max_width = 35,
		},
        relative_width = true,
	},
}
