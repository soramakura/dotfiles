return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
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
    integrations = {
      gitsigns = true,
      markdown = true,
      mason = true,
      cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      nvim_surround = true,
      treesitter = true,
      telescope = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
    vim.opt.cursorline = false

    vim.keymap.set("n", "<C-s>", function()
      local cat = require("catppuccin")

      -- Toggle whether the background is transparent or not.
      cat.options.transparent_background = not cat.options.transparent_background
      -- Hide cursorline when the background is transparent.
      -- I don't know why, but `vim.opt.cursorline = not vim.opt.cursorline`
      -- doesn't work.
      vim.opt.cursorline = not cat.options.transparent_background

      cat.compile()
      vim.cmd.colorscheme("catppuccin")
    end, { noremap = true, silent = true })
  end,
}
