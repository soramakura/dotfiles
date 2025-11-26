local lsp_config_table = {
  ["lua_ls"] = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },

  ["rust_analyzer"] = {
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  },
}

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
    "neovim/nvim-lspconfig",
    cmd = {
      "LspInfo",
      "LspStart",
      "LspStop",
      "LspRestart",
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonUpdate",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
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
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "FileType" },
    cmd = {
      "LspInstall",
      "LspUninstall",
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "clangd",
        "lua_ls",
        "rust_analyzer",
      },
    },
    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      for lsp_name, conf in pairs(lsp_config_table) do
        vim.lsp.config(lsp_name, conf)
      end

      require("mason-lspconfig").setup(opts)
    end
  },
}
