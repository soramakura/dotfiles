return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermExec",
  },
  keys = {
    { "<Esc><Esc>", "<C-\\><C-n>",                    mode = "t" },
    { "<leader>c",  "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "<leader>t",  "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "<leader>ss", "<CMD>ToggleTerm<CR>",            mode = "n" },
    { "<leader>lg", "<CMD>lua _lazygit_toggle()<CR>", mode = "n" },
  },
  opts = {
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
