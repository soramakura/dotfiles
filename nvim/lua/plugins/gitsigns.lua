return {
    "lewis6991/gitsigns.nvim",
    dependencies = { "petertriho/nvim-scrollbar" },
    event = { "BufReadPre", "BufNewFile" },
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        signs = {
            add          = { text = "┆" },
            change       = { text = "┆" },
            delete       = { text = "" },
            topdelete    = { text = "" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
    },
    config = function()
        require("gitsigns").setup()
        require("scrollbar.handlers.gitsigns").setup()
    end,
}
