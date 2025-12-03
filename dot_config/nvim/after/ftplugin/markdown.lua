-- allow folding on headings, bullets, etc.
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"

-- start with no folds folded
vim.wo.foldlevel = 99
-- set spell checking in markdown files
vim.wo.spell = true

vim.wo.conceallevel = 2

vim.keymap.set("n", "<leader>mo", function()
	-- Passing nil forces it to re-scan the buffer for ANY languages
	require("otter").activate(nil, true, true, nil)
	print("[Otter] Refreshed code blocks")
end, { desc = "Refresh [O]tter code blocks" })
