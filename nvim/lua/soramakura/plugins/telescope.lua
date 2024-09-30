local set_keymap = vim.keymap.set
local keymap_opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function(_, _)
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        file_browser = {
          respect_gitignore = false,
          follow_symlinks = true,
          hijack_netrw = true,
        },
      },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("file_browser")

    local builtin = require("telescope.builtin")
    local open_file_browser = function()
      require("telescope").extensions.file_browser.file_browser()
    end
    set_keymap("n", "<leader><leader>", builtin.buffers, keymap_opts("Search buffers"))
    set_keymap("n", "<leader>sb", builtin.buffers, keymap_opts("Search buffers"))
    set_keymap("n", "<leader>sf", builtin.find_files, keymap_opts("Search files"))
    set_keymap("n", "<leader>sg", builtin.live_grep, keymap_opts("Search files by grep"))
    set_keymap("n", "<leader>sr", builtin.registers, keymap_opts("Search registers"))
    set_keymap("n", "<leader>sk", builtin.keymaps, keymap_opts("Search keymaps"))
    set_keymap("n", "<leader>st", builtin.filetypes, keymap_opts("Search file types"))
    set_keymap("n", "<leader>sh", builtin.help_tags, keymap_opts("Search help"))
    set_keymap("n", "<leader>ss", builtin.treesitter, keymap_opts("Search symbols"))
    set_keymap("n", "<leader>e", open_file_browser, keymap_opts("Open file browser"))
  end,
}
