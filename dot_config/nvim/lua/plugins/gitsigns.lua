-- gitsigns - shows git changes in gutter
return {
	"lewis6991/gitsigns.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("gitsigns").setup()
	end,
}
