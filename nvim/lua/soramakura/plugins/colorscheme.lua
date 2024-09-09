return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      code_style = {
        background = {
          light = "latte",
          dark = "macchiato",
        },
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        term_colors = true,
        integrations = {
          bufferline = true,
          cmp = true,
          gitsigns = true,
          markdown = true,
          nvimtree = true,
          sandwich = true,
          treesitter = true,
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1001,
  },
}
