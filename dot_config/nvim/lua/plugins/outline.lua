-- outline - show outline of headings, function, variables, etc.
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle [O]utline" },
	},
	opts = {
	},
}
