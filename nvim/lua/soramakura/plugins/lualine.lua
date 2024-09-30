return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
  },
}
