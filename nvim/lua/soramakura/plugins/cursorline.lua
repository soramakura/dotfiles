return {
  "yamatsum/nvim-cursorline",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    },
  },
  config = function(_, opts)
    require("nvim-cursorline").setup(opts)
  end,
}
