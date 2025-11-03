return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}
