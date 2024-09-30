return {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermExec",
  },
  keys = {
    { "<A-s>",      "<CMD>ToggleTerm<CR>",          mode = "n" },
    { "<leader>lg", "<CMD>lua ToggleLazygit()<CR>", mode = "n" },
  },
  opts = {
    open_mapping = { "<A-s>" },
    presist_mode = false,
    diretion = "float",
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    function ToggleLazygit()
      lazygit:toggle()
    end
  end,
}
