-- bufferline - shows active buffers (tabs) at top of screen
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true

		require("bufferline").setup({})

		vim.keymap.set("n", "<leader>h", ":bprev<CR>", { desc = "Previous tab (buffer)" })
		vim.keymap.set("n", "<leader>bh", ":bprev<CR>", { desc = "Previous tab (buffer)" })
		vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next tab (buffer)" })
		vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Next tab (buffer)" })
		vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close tab (buffer)" })
		vim.keymap.set("n", "<leader>bq", ":bd<CR>", { desc = "Close tab (buffer)" })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle buffer pin" })
		vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
		vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
	end,
}
