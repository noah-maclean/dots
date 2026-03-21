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
			"ribru17/blink-cmp-spell",
			{
				{
					"L3MON4D3/LuaSnip",
					version = "v2.*",
					config = function()
						-- only show latex snippets inside math blocks in markdown - made by Gemini
						-- 1. EAGERLY load tex/latex snippets so we can modify them immediately
						require("luasnip.loaders.from_vscode").load({
							include = { "tex", "latex" },
						})

						-- 2. LAZY load the rest of the snippets (excluding 'all' and the ones we just loaded)
						require("luasnip.loaders.from_vscode").lazy_load({
							exclude = { "all", "tex", "latex" },
						})

						local ls = require("luasnip")
						-- for creating snippets:
						local s = ls.snippet
						local t = ls.text_node
						local i = ls.insert_node
						local f = ls.function_node

						ls.setup({ enable_autosnippets = true })

						-- Link the filetypes so markdown has access to them
						ls.filetype_extend("markdown", { "tex", "latex" })

						-- 3. Define the dynamic math zone check
						local function in_mathzone()
							-- Always show snippets if we are actually in a full latex file
							if vim.bo.filetype == "tex" or vim.bo.filetype == "latex" then
								return true
							end

							-- Treesitter check
							local has_ts, _ = pcall(vim.treesitter.get_parser)
							if has_ts then
								local node = vim.treesitter.get_node({ ignore_injections = false })
								while node do
									if
										vim.tbl_contains({
											"math_block",
											"math_environment",
											"inline_formula",
											"latex_span",
											"latex_block",
											"math",
										}, node:type())
									then
										return true
									end
									node = node:parent()
								end
							end

							-- Vimtex fallback check
							if vim.bo.filetype == "markdown" and vim.fn.exists("*vimtex#syntax#in_mathzone") == 1 then
								return vim.fn["vimtex#syntax#in_mathzone"]() == 1
							end

							return false
						end

						-- custom snippets
						-- s({...}) - defines the snippet - trig is the word you type to trugger it
						-- t("...") is a text node (literal string that gets inserted) - use a table of strings t({"line 1", "line 2"}) for mutliline text
						-- i(X, "default") is an insert node (where the cursor jumps to when you press Tab) - i(0) is always the end
						ls.add_snippets("tex", {
							s({ trig = "text", name = "Text", dscr = "\\text{text}" }, {
								t("\\text{"),
								i(1, "Text"),
								t("}"),
								i(0),
							}),

							s({ trig = "sqrt", name = "Square Root", dscr = "\\sqrt{x}" }, {
								t("\\sqrt{"),
								i(1, "x"),
								t("}"),
								i(0),
							}),

							-- auto subscript
							s({
								trig = "_",
								snippetType = "autosnippet",
								wordTrig = false,
							}, {
								t("_{"),
								i(1),
								t("}"),
								i(0),
							}, {
								condition = in_mathzone,
							}),

							-- auto superscript
							s({
								trig = "^",
								snippetType = "autosnippet",
								wordTrig = false,
							}, {
								t("^{"),
								i(1),
								t("}"),
								i(0),
							}, {
								condition = in_mathzone,
							}),
						})

						ls.add_snippets("markdown", {
							-- remove the "-" -> \itemize snippet
							s({ trig = "-", priority = 2000 }, {
								t("- "),
								i(0),
							}),
							s({ trig = "- ", priority = 2000 }, {
								t("    - "),
								i(0),
							}),
						})

						-- 4. Inject the condition directly into the snippet objects
						for _, ft in ipairs({ "tex", "latex" }) do
							local snips = ls.get_snippets(ft)
							if snips then
								for _, snip in pairs(snips) do
									-- Hides the snippet from the visual menu outside of math zones
									snip.show_condition = in_mathzone
									-- BLOCKS the snippet from expanding when you press Tab outside of math zones
									snip.condition = in_mathzone
								end
							end
						end
					end,
				},
			},
		},

		event = "InsertEnter",

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "super-tab",

				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

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
				default = { "lazydev", "lsp", "snippets", "buffer", "path", "spell" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					lsp = {
						name = "lsp",
						score_offset = 90,
					},
					snippets = {
						name = "snippets",
						score_offset = 90,
					},
					buffer = {
						name = "buffer",
						score_offset = 50,
						-- min number of characters needed to trigger buffer
						min_keyword_length = 2,
					},
					spell = {
						name = "Spell",
						module = "blink-cmp-spell",
						score_offset = 40, -- less than all others
						opts = {
							-- EXAMPLE: Only enable source in `@spell` captures, and disable it
							-- in `@nospell` captures.
							enable_in_context = function()
								local curpos = vim.api.nvim_win_get_cursor(0)
								local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
								local in_spell_capture = false
								for _, cap in ipairs(captures) do
									if cap.capture == "spell" then
										in_spell_capture = true
									elseif cap.capture == "nospell" then
										return false
									end
								end
								return in_spell_capture
							end,
							max_entries = 2,
						},
					},
				},

				-- per_filetype = {
				-- 	markdown = { "lsp", "snippets", "path", "buffer", "obsidian", "obsidian_tags", "obsidian_new" }, -- only for obsidian files
				-- },

				-- ignore random text from LSPs
				-- transform_items = function(_, items)
				-- 	return vim.tbl_filter(function(item)
				-- 		return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
				-- 	end, items)
				-- end,
			},

			-- It is recommended to put the "label" sorter as the primary sorter for the spell source
			fuzzy = {
				sorts = {
					function(a, b)
						local sort = require("blink.cmp.fuzzy.sort")
						if a.source_id == "spell" and b.source_id == "spell" then
							return sort.label(a, b)
						end
					end,
					-- This is the normal default order, which we fall back to
					"score",
					"kind",
					"label",
				},
			},

			signature = { enabled = true },

			cmdline = { enabled = false },
		},
		opts_extend = { "sources.default" },
	},
}
