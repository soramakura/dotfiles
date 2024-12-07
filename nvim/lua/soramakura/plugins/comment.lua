return {
  {
    "tpope/vim-commentary",
    event = { "BufEnter" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
