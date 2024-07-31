return {
    "navarasu/onedark.nvim",
    event = { "VimEnter" },
    opts = {
        style = "darker",
    },
    config = function(_, opts)
        require("onedark").setup(opts)
        require("onedark").load()
    end,
}

