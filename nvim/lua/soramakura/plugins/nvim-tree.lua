return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
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

    local nvim_tree_group = vim.api.nvim_create_augroup("NvimTreeConfig", { clear = true })
    vim.api.nvim_create_autocmd("BufEnter", {
      group = nvim_tree_group,
      callback = function()
        local nvim_tree_api = require("nvim-tree.api")

        if nvim_tree_api.tree.is_tree_buf(nil) then
          -- Always show the latest status
          nvim_tree_api.tree.reload()
        else
          -- Aotomatically closes the filer when not in use
          nvim_tree_api.tree.close()
        end
      end,
    })
  end,
}
