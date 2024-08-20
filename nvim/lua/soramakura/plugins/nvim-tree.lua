return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "navarasu/onedark.nvim",
  },
  cond = function ()
    return not vim.g.vscode
  end,
  cmd = {
    "NvimTreeToggle",
  },
  keys = {
    { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = "n" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
      relativenumber = false,
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = false,
      },
      highlight_git = "name",
      highlight_opened_files = "icon",
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".DS_Store" },
    },
    git = {
      ignore = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
