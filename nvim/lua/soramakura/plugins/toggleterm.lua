return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermExec",
  },
  keys = {
    { "<leader>s", "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "lg",        "<CMD>lua _lazygit_toggle()<CR>", mode = "n" }
  },
  opts = {
    direction = "float",
    float_opts = {
      winblend = 8
    }
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })
    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
