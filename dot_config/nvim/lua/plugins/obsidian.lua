-- obsidian nvim - allows obsidian vault files to be traversed properly in nvim
return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		-- "BufReadPre path/to/my-vault/*.md",
		-- "BufNewFile path/to/my-vault/*.md",

		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Documents/Uni Notes",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Uni Notes",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "uni",
				path = "~/Documents/Uni Notes",
			},
			-- {
			--   name = "work",
			--   path = "~/vaults/work",
			-- },
		},

		attachments = {
			img_folder = "/Attachments",
		},
	},
}
