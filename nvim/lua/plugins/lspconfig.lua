return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        {
            "williamboman/mason.nvim",
            opts = {
                ensure_installed = {
                    "rust-analyzer",
                },
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
            end,
        },
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _)
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            automatic_installation = true,
        })

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    ),
                })
            end,
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                    capabilities = require("cmp_nvim_lsp").default_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    ),
                })
            end,
            ["rust_analyzer"] = function()
                require("lspconfig").rust_analyzer.setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    ),
                })
            end,
        })
    end,
}

