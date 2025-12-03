-- obsidian-nvim - allows obsidian vault to be used very similarly in nvim as it is in the obsidian app
-- otter - allows lsp features (e.g. code completion) for code in code blocks
return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		-- ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
			--   -- refer to `:h file-pattern` for more examples
			"BufReadPre "
				.. vim.fn.expand("~")
				.. "/Documents/Uni Notes/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Uni Notes/*.md",
		},
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				-- {
				--   name = "personal",
				--   path = "~/vaults/personal",
				-- },
				-- {
				--   name = "work",
				--   path = "~/vaults/work",
				-- },
				{
					name = "uni notes",
					path = "~/Documents/Uni Notes/",
				},
			},
			attachments = {
				img_folder = "Attachments",
			},
			-- see below for full list of options 👇
		},

		-- autocommands
		config = function(_, opts)
			require("obsidian").setup(opts)

			-- format codeblocks
			vim.api.nvim_create_autocmd("User", {
				pattern = "ObsidianNoteWritePost",
				callback = function(ev)
					require("conform").format({
						bufnr = ev.buf,
						formatters = { "prettier", "injected" },
					})
				end,
			})
		end,
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},

		--- Activate the current buffer by adding and synchronizing
		---@param languages table|nil List of languages to activate. If nil, all available languages will be activated.
		---@param completion boolean|nil Enable completion for otter buffers. Default: true
		---@param diagnostics boolean|nil Enable diagnostics for otter buffers. Default: true
		---@param tsquery string|nil Explicitly provide a treesitter query. If nil, the injections query for the current filetyepe will be used. See :h treesitter-language-injections.
		config = function()
            require("otter").setup({
                lsp = {
                    diagnostic_update_events = { "BufWritePost", "InsertLeave", "TextChanged" },
                }
            })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				group = vim.api.nvim_create_augroup("OtterActivate", { clear = true }),
				callback = function()
					require("otter").activate(nil, true, true, nil)
				end,
			})
		end,
	},
}
