return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "FileType" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "c",
      "rust",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "git_config",
      "gitignore",
      "gitattributes",
      "diff",
      "git_rebase",
      "gitcommit",
    },
  },
  config = function(_, opts)
    local treesitter = require("nvim-treesitter")
    treesitter.setup()

    -- Install the parsers listed in ensure_installed.
    treesitter.install(opts.ensure_installed or {})

    local ts_available_filetypes = vim.iter(treesitter.get_available())
        :map(function(lang)
          return vim.treesitter.language.get_filetypes(lang)
        end)
        :flatten()
        :totable()

    local ts_installed_filetypes = vim.iter(treesitter.get_installed())
        :map(function(lang)
          return vim.treesitter.language.get_filetypes(lang)
        end)
        :flatten()
        :totable()

    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("soramakura::config::plugins::treesitter", {}),
      pattern = ts_available_filetypes,
      callback = function(args)
        local filetype = args.match

        if vim.tbl_contains(ts_installed_filetypes, filetype) then
          vim.treesitter.start()
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        else
          treesitter.install(filetype)
          -- Update filetypes supported by installed parsers.
          ts_installed_filetypes = vim.iter(treesitter.get_installed())
              :map(function(lang)
                return vim.treesitter.language.get_filetypes(lang)
              end)
              :flatten()
              :totable()
        end
      end
    })
  end,
}
