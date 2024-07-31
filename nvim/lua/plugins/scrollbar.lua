return {
  "petertriho/nvim-scrollbar",
  dependencies = { "navarasu/onedark.nvim" },
  event = { "BufWinEnter" },
  opts = function()
    local colors = require("onedark.colors")
    return {
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    }
  end,
  config = function(_, opts)
    require("scrollbar").setup(opts)
  end,
}
