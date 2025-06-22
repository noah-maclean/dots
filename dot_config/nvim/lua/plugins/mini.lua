-- mini - a library of plugins
return {
	{
		-- ai (around/in) - extend and create a/i objects
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		-- pairs - autopairs
		"echasnovski/mini.pairs",
		version = false,

		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		-- surround - surround actions
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,

		-- add = 'sa', -- Add surrounding in Normal and Visual modes
		-- delete = 'sd', -- Delete surrounding
		-- find = 'sf', -- Find surrounding (to the right)
		-- find_left = 'sF', -- Find surrounding (to the left)
		-- highlight = 'sh', -- Highlight surrounding
		-- replace = 'sr', -- Replace surrounding
		-- update_n_lines = 'sn', -- Update `n_lines`
		--
		-- suffix_last = 'l', -- Suffix to search with "prev" method
		-- suffix_next = 'n', -- Suffix to search with "next" method
	},
	{
		-- comment - comment lines
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()
		end,
		keys = {
			{ "<C-e>", "<cmd>lua MiniFiles.open()<cr>", desc = "Open Mini Files" },
		},
	},
}
