-- lazydev - adds completions for neovim configuration
-- blink.cmp with friendly-snippets and luasnip
-- adds autocompletion functionality with snippets similar to VSCode

-- replacing nvim-cmp as it uses frecency and fuzzy finding
-- also worked better with less config
return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},

		event = "InsertEnter",

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		-- ---@module 'blink.cmp'
		-- ---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "super-tab",

				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				-- ["<CR>"] = { "accept", "fallback" },
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				-- menu = {
				-- 	draw = {
				-- 		treesitter = { "lsp" },
				-- 		-- make it look like nvim.cmp
				-- 		-- columns = {
				-- 		--     { "label", "label_description", gap = 1 },
				-- 		--     { "kind_icon", "kind" }
				-- 		-- }
				-- 	},
				-- },

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},

				ghost_text = {
					enabled = true,
				},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			snippets = { preset = "luasnip" },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lazydev", "lsp", "snippets", "buffer", "path" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					lsp = {
						score_offset = 90,
					},
					snippets = {
						score_offset = 80,
					},
				},
			},

			signature = { enabled = true },

			cmdline = { enabled = false },
		},
		opts_extend = { "sources.default" },
	},
}
