return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  priority = 1000,
  opts = {
    -- disabled modules
    animate = { enabled = false, },
    bufdelete = { enabled = false, },
    dashboard = { enabled = false, },
    dim = { enabled = false, },
    image = { enabled = false, },
    indent = { enabled = false, },
    scratch = { enabled = false, },
    scroll = { enabled = false, },
    terminal = { enabled = false, },
    toggle = { enabled = false, },
    words = { enabled = false, },
    zen = { enabled = false, },

    -- enabled modules
    bigfile = { enabled = true, },
    debug = { enabled = true, },
    explorer = { enabled = true, },
    gh = { enabled = true, },
    git = { enabled = true, },
    gitbrowse = { enabled = true },
    input = { enabled = true, },
    keymap = { enabled = true, },
    layout = { enabled = true, },
    lazygit = { enabled = true, },
    notifier = { enabled = true, },
    notify = { enabled = true, },
    picker = { enabled = true, },
    profiler = { enabled = true, },
    quickfile = { enabled = true, },
    rename = { enabled = true, },
    statuscolumn = { enabled = true, },
  },
  init = function()

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          --@
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        if vim.fn.has("nvim-0.11") == 1 then
          ---@diagnostic disable-next-line: duplicate-set-field
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })
  end,
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}
