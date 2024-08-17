return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "navarasu/onedark.nvim",
  },
  event = { "BufEnter" },
  keys = {
    { "<S-h>",      "<CMD>BufferLineCyclePrev<CR>",   mode = "n" },
    { "<S-l>",      "<CMD>BufferLineCycleNext<CR>",   mode = "n" },
    { "[b",         "<CMD>BufferLineCyclePrev<CR>",   mode = "n" },
    { "]b",         "<CMD>BufferLineCycleNext<CR>",   mode = "n" },
    { "[B",         "<CMD>BufferLineMovePrev<CR>",    mode = "n" },
    { "]B",         "<CMD>BufferLineMoveNext<CR>",    mode = "n" },
    { "<leader>bp", "<CMD>BufferLineTogglePin<CR>",   mode = "n" },
    { "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", mode = "n" },
    { "<leader>br", "<CMD>BufferLineCloseRight<CR>",  mode = "n" },
    { "<leader>bl", "<CMD>BufferLineCloseLeft<CR>",   mode = "n" },
  },
  opts = {
    options = {
      separator_style = "thick",
      show_buffer_clone_icons = true,
      show_clone_icon = true,
      color_icons = true,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
