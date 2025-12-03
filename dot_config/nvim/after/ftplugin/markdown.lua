-- allow folding on headings, bullets, etc.
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"

-- start with all folds closed
vim.wo.foldlevel = 99
-- set spell checking in markdown files
vim.wo.spell = true

vim.wo.conceallevel = 2
