return {
  "navarasu/onedark.nvim",
  event = { "VimEnter" },
  opts = {
    style = "cool",
    transparent = true,
    lualine = {
      transparent = true,
    }
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
