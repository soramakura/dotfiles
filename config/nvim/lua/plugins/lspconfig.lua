return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", word = { "vim%.uv" } },
      },
    },
  },
  {
    "Bilal2453/luvit-meta",
    ft = "lua",
  },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = true
    end,
  },
  {
    "williamboman/mason.nvim",
    event = { "BufNewFile", "BufReadPre" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          "clangd",
          "lua_ls",
          "rust_analyzer",
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = {
      "LspInfo",
      "LspInstall",
      "LspStart",
      "LspRestart",
    },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      vim.lsp.enable(require('mason-lspconfig').get_installed_servers())
    end,
  },
}
