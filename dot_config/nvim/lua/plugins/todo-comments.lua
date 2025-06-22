-- todo-comments - highlights and colours TODO comments
-- e.g. TODO, HACK, WARN, PERF, NOTE, TEST
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            { desc = "Next todo comment" },
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            { desc = "Previous todo comment" },
        },
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo comments",
        },
        {
            "<leader>sT",
            function()
                Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
            end,
            desc = "Todo/Fix/Fixme",
        },
    },
}
