return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "VeryLazy" },
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
  },
}
