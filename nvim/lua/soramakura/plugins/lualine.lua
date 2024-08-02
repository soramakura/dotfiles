return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "navarasu/onedark.nvim",
  },
  event = { "VimEnter" },
  opts = {
    options = {
      theme = "onedark",
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
