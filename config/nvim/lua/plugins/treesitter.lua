return {
  "romus204/tree-sitter-manager.nvim",
  event = { "FileType" },
  opts = {
    ensure_installed = {
      "c",
      "rust",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "diff",
    },
    auto_install = true,
    highlight = true,
  },
  config = function(_, opts)
    require("tree-sitter-manager").setup(opts)
  end,
}
