-- alpha-nvim - greeter for nvim to show startup page
return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local time = os.date("%H:%M")
		local date = os.date("%a %d %b")
		local v = vim.version()
		local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

		-- width of ascii art in header
		local art_width = 74

		function CenterText(text, width)
			local totalPadding = width - #text
			local leftPadding = math.floor(totalPadding / 2)
			local rightPadding = totalPadding - leftPadding
			return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
		end

		dashboard.section.header.val = {
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			CenterText(date, art_width),
			CenterText(time, art_width),
			CenterText(version, art_width),
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰮗   Find file", function()
				Snacks.picker.smart()
			end),
			dashboard.button("e", "   File Explorer", function()
				Snacks.explorer()
			end),
			dashboard.button("r", "   Recent", function()
				Snacks.picker.recent()
			end),
			dashboard.button("c", "   Configuration", ":e ~/.config/nvim/<CR>"),
			dashboard.button("R", "󱘞   Ripgrep", function()
				Snacks.picker.grep()
			end),
			dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
