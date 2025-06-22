return {
    {
        -- render-markdown - styles the markdown components to look nicer
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = "markdown",
        opts = {},
        keys = {
            {
                "<leader>m",
                function()
                    require("render-markdown").toggle()
                end,
                desc = "Toggle markdown rendering",
            },
        },
        config = function()
            require("render-markdown").setup({
                latex = {
                    enabled = false,
                },
            })
        end,
    },
    {
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
    },
}
