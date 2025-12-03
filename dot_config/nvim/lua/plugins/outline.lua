-- outline - show outline of headings
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle [O]utline" },
	},
	opts = {
		-- Your setup opts here
	},
}
