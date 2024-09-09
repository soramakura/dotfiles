return {
  {
    "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>f", mode = "n" }
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      { "<leader>f", mode = "n" },
    },
  },
  {

  "nvim-telescope/telescope.nvim",
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>ff", builtin.find_files,                                              mode = "n" },
      { "<leader>fg", builtin.live_grep,                                               mode = "n" },
      { "<leader>fb", builtin.buffers,                                                 mode = "n" },
      { "<leader>fh", builtin.help_tags,                                               mode = "n" },
    }
  end,
  opts = {
    defaults = {
      winblend = 8,
      file_ignore_patterns = {
        "^.git/",
        "^.cache/",
        "Parallels",
        "^Movies",
        "^Music",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "-uu",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "-g",
          "!.git",
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)

    require("telescope").load_extension("file_browser")
  end,
},
}
