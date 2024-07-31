return {
  "dinhhuy258/git.nvim",
  cmd = { "Git" },
  cond = function()
    return not vim.g.vscode
  end,
}
