return {
  "navarasu/onedark.nvim",
  event = { "VimEnter" },
  opts = {
    style = "cool",
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
