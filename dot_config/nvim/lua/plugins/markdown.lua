return {
	-- {
	-- 	-- render-markdown - styles the markdown components to look nicer
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	-- 	ft = "markdown",
	-- 	opts = {},
	-- 	keys = {
	-- 		{
	-- 			"<leader>m",
	-- 			function()
	-- 				require("render-markdown").toggle()
	-- 			end,
	-- 			desc = "Toggle markdown rendering",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			latex = {
	-- 				enabled = false,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- Completion for `blink.cmp`
		dependencies = { "saghen/blink.cmp" },
		vim.api.nvim_set_keymap(
			"n",
			"<leader>mt",
			"<CMD>Markview toggle<CR>",
			{ desc = "[T]oggle [M]arkdown rendering" }
		),
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ms",
			"<CMD>Markview splitToggle<CR>",
			{ desc = "Toggle rendering [M]arkdown in [S]plit" }
		),

		opts = {
			preview = {
				-- modes where previews are shown
				-- default = modes = { "n", "no", "c" }
				modes = { "n", "no", "c", "i" },
				-- show unrendered markdown in normal mode
				hybrid_modes = { "n", "i" },
				linewise_hybrid_mode = true,

				-- no delay to refresh preview
				debounce = 0,
			},

			markdown = {
				headings = {
					-- remove extra indentations for headings
					shift_width = 0,
				},
				list_items = {
					-- remove extra indentations for list items
					shift_width = 0,
					indent_size = 0,
					marker_minus = { add_padding = false },
					marker_plus = { add_padding = false },
					marker_star = { add_padding = false },
					marker_dot = { add_padding = false },
				},
			},
		},
	},
	{
		-- mdmath - markdown equation previewer using Kitty Graphics Protocol
		-- size and formatting is a bit wierd but works better than alternatives that i tried
		-- requires:
		-- nodejs
		-- npm
		-- imagemagick v6/7
		-- rsvg-convert (apt install librsvg2-bin)
		"Thiago4532/mdmath.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
        -- markdown-plus -  adds keybindings for bold, italics, etc. as well as tables, callouts and smart enter for list items
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown", -- Load on markdown files by default
		config = function()
			require("markdown-plus").setup({
				-- Configuration options (all optional)
				enabled = true,
				features = {
					list_management = true, -- List management features
					text_formatting = true, -- Text formatting features
					headers_toc = true, -- Headers + TOC features
					links = true, -- Link management features
					images = true, -- Image link management features
					quotes = true, -- Blockquote toggling feature
					callouts = true, -- GFM callouts/admonitions feature
					code_block = true, -- Code block conversion feature
					table = true, -- Table support features
					footnotes = true, -- Footnotes management features
				},
				footnotes = { -- Footnotes configuration
					section_header = "Footnotes", -- Header for footnotes section
					confirm_delete = true, -- Confirm before deleting footnotes
				},
				keymaps = {
					enabled = true, -- Enable default keymaps (<Plug> available for custom)
				},
				toc = { -- TOC window configuration
					initial_depth = 2,
				},
				callouts = { -- Callouts configuration
					default_type = "NOTE",
					custom_types = {}, -- Add custom types like { "DANGER", "SUCCESS" }
				},
				table = { -- Table sub-configuration
					auto_format = true,
					default_alignment = "left",
					confirm_destructive = true, -- Confirm before transpose/sort operations
					keymaps = {
						enabled = true,
						prefix = "<leader>t",
						insert_mode_navigation = true, -- Alt+hjkl cell navigation
					},
				},
				filetypes = { "markdown" }, -- Filetypes to enable the plugin for
			})
		end,
	},
}
