return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufEnter" },

    keys = {
        { "<Tab>", "<CMD>BufferLineCycleNext<CR>" },
        { "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>" },
    },
    opts = {
        options = {
            separator_style = "thick",
            show_buffer_clone_icons = true,
            show_clone_icon = true,
            color_icons = true,
        },
        highlights = {
            separator = {
                fg = "#073642",
                bg = "#000000",
            },
            background = {
                fg = "#657b83",
                bg = "#000000",
            },
            buffer_selected = {
                fg = "#ffffff",
                bg = "#000000",
            },
            fill = {
                bg = "#073642",
            },
        }
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end,
}

