return {
  "navarasu/onedark.nvim",
  event = { "VimEnter" },
  opts = {
    style = "cool",
    code_style = {
      comments = "none",
    },
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
