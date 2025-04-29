local set_lsp_keymaps = function()
  local set_keymap = vim.keymap.set
  local opts = function(desc)
    return { desc = desc, noremap = true, silent = true }
  end

  local builtin = require("telescope.builtin")
  set_keymap("n", "gd", builtin.lsp_definitions, opts("Go to definition"))
  set_keymap("n", "gy", builtin.lsp_type_definitions, opts("Go to type definition"))
  set_keymap("n", "gi", builtin.lsp_implementations, opts("Go to implementation"))
  set_keymap("n", "gr", builtin.lsp_references, opts("Go to references"))
  set_keymap("n", "<leader>d", function()
    builtin.diagnostics({ bufnr = 0 })
  end, opts("Show diagnostics"))
end

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
  "Bilal2453/luvit-meta",
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
        automatic_installation = true,
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
          notification  = {
            window = {
              winblend = 0,
            },
          },
        },
      },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          -- default handler
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              capabilities = capabilities,
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
          vim.lsp.enable("lua_ls")
        end,
        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                check = {
                  command = "clippy",
                },
              },
            },
          })
          vim.lsp.enable("rust_analyzer")
        end,
      })

      set_lsp_keymaps()
    end,
  },
}
