-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ higroup = "Visual", timeout = 250 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	callback = function()
        vim.opt_local.statuscolumn = ""
	end,
})
