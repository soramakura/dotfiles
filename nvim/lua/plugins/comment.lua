return {
  {
    "tpope/vim-commentary",
    keys = { "g" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufEnter" },
    opts = {},
  },
}
