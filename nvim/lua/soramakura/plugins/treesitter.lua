return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = "BufWinEnter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "gitignore",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "cmake",
      "cpp",
      "rust",
    },
    autoinstall = true,
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
