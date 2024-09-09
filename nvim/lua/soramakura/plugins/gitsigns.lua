return {
  "lewis6991/gitsigns.nvim",
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
  end,
}
