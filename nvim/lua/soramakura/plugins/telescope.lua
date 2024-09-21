return {
  {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {

    "nvim-telescope/telescope.nvim",
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        { "<leader>ff", builtin.find_files,           mode = "n" },
        { "<leader>fg", builtin.live_grep,            mode = "n" },
        { "<leader>fb", builtin.buffers,              mode = "n" },
        { "<leader>fr", builtin.registers,            mode = "n" },
        { "<leader>fk", builtin.keymaps,              mode = "n" },
        { "<leader>ft", builtin.filetypes,            mode = "n" },
        { "<leader>fh", builtin.help_tags,            mode = "n" },
        { "<leader>gb", builtin.git_branches,         mode = "n" },
        { "<leader>gc", builtin.git_commits,          mode = "n" },
        { "<leader>gs", builtin.git_status,           mode = "n" },
        { "gr",         builtin.lsp_references,       mode = "n" },
        { "gd",         builtin.lsp_definitions,      mode = "n" },
        { "gy",         builtin.lsp_type_definitions, mode = "n" },
        { "gi",         builtin.lsp_implementations,  mode = "n" },
        { "ge",         builtin.diagnostics,          mode = "n" },
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
      require("telescope").load_extension("ui-select")
    end,
  },
}
