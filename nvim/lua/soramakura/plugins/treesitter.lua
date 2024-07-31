return {
  "nvim-treesitter/nvim-treesitter",
  branch = "feat/version",
  build = "<CMD>TSUpdate",
  event = "BufWinEnter",
  opts = {
    ensure_installed = {
      "cmake",
      "cpp",
      "gitignore",
      "rust",
    },
    highlight = {
      enbale = true,
      additional_vim_regex_highlightint = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    -- MDX
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx");
  end,
}
