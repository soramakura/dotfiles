return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermExec",
  },
  keys = {
    { "<A-j>",      "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "<F2>",       "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "<Esc><Esc>", "<C-\\><C-n>",                    mode = "t" },
    { "<leader>lg", "<CMD>lua _lazygit_toggle()<CR>", mode = "n" },
  },
  opts = {
    open_mapping = {
      "<A-j>",
      "<F2>",
    },
    persist_mode = false,
    direction = "float",
    float_opts = {
      winblend = 8,
    },
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
