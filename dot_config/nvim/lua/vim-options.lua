-- default vim options for the editor

-- maps leader to <Space>
vim.g.mapleader = " "

local opt = vim.opt

-- set tab to be 4 spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- enable hybrid line numbers
opt.number = true
opt.relativenumber = true

-- set the number of lines to keep above and below the cursor
opt.scrolloff = 10

-- true colour support
opt.termguicolors = true

-- ignore case (e.g. in search)
opt.ignorecase = true

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- allow copying and pasting from system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
