-- fun plugins
return {
	{
		-- blackjack
        -- ":BlackJackResetScores" will reset the scores
		"alanfortlink/blackjack.nvim",
		event = "VeryLazy",
		config = function()
			require("blackjack").setup({ card_style = "large" })
		end,
		keys = {
			{ "<leader>pb", "<cmd>BlackJackNewGame<cr>", desc = "BlackJack" },
		},
	},
	{
		-- cellular automaton (make it rain and game of life)
		"eandrju/cellular-automaton.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>pg", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of Life" },
			{ "<leader>pr", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it Rain" },
		},
	},
	{
		-- killer sheep vim game
		"seandewar/killersheep.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>pk", "<cmd>KillKillKill<cr>", desc = "Killer Sheep" },
		},
	},
	{
		-- duck - walks around code until cooked
		"tamton-aquib/duck.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>pdd", function()
				require("duck").hatch()
			end, { desc = "Release a duck" })

			vim.keymap.set("n", "<leader>pdc", function()
				require("duck").hatch("🐈", 20)
			end, { desc = "Release a cat" })

			vim.keymap.set("n", "<leader>pdk", function()
				require("duck").cook()
			end, { desc = "Cook a duck/cat" })

			vim.keymap.set("n", "<leader>pda", function()
				require("duck").cook_all()
			end, { desc = "Cook all ducks/cats" })
		end,
	},
}
