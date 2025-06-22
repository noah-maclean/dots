-- noice - nicer message views and cmdline
-- mostly used to make the cmdline look nice
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	require("noice").setup({
		-- show @ (macros) recording in noice
		-- routes = {
		--     {
		--         view = "notify",
		--         filter = { event = "msg_showmode" },
		--     },
		-- },
	}),
}
