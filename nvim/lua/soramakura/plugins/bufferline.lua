return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "navarasu/onedark.nvim",
  },
  event = { "BufEnter" },

  keys = {
    { "<C-S-h>",    "<CMD>BufferLineMovePrev<CR>",  mode = "n" },
    { "<C-S-l>",    "<CMD>BufferLineMoveNext<CR>",  mode = "n" },
    { "<S-h>",      "<CMD>BufferLineCyclePrev<CR>", mode = "n" },
    { "<S-l>",      "<CMD>BufferLineCycleNext<CR>", mode = "n" },
    { "[b",         "<CMD>BufferLineCyclePrev<CR>", mode = "n" },
    { "]b",         "<CMD>BufferLineCycleNext<CR>", mode = "n" },
    { "<leader>bd", "<CMD>BufferLineClose<CR>",     mode = "n" },
    { "<leader>bn", "<CMD>tabnew<CR>",              mode = "n" },
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
