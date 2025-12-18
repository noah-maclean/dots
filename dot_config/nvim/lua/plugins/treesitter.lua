-- treesitter - basic language functionality such as highlighting using tree-sitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- local config = require("nvim-treesitter.configs")
			-- config.setup({
			-- 	auto_install = true,
			-- 	highlight = { enable = true },
			-- 	indent = { enable = true },
			-- 	ensure_installed = {
			-- 		"lua",
			-- 		"python",
			-- 		"c",
			-- 		"html",
			-- 		"css",
			-- 		"javascript",
			-- 		"markdown",
			-- 		"markdown_inline",
			-- 		"vim",
			-- 	},
			-- })
			local ts = require("nvim-treesitter")
			ts.install({
				"lua",
				"python",
				"c",
				"html",
				"css",
				"javascript",
				"markdown",
				"markdown_inline",
				"vim",
			})

			local ignore_filetypes = {
				"checkhealth",
				"lazy",
				"mason",
				"snacks_dashboard",
				"snacks_notif",
				"snacks_win",
			}

			local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

			-- auto-install parsers and enable highlighting on FileType
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				desc = "Enable treesitter highlighting and indentation",
				callback = function(event)
					if vim.tbl_contains(ignore_filetypes, event.match) then
						return
					end

					local lang = vim.treesitter.language.get_lang(event.match) or event.match
					local buf = event.buf

					-- Start highlighting immediately (works if parser exists)
					pcall(vim.treesitter.start, buf, lang)

					-- Enable treesitter indentation
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- Install missing parsers (async, no-op if already installed)
					ts.install({ lang })
				end,
			})
		end,
	},
}
