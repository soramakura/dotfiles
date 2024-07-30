return {{
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    opts = {
        ensure_installed = {
            "cmake",
            "cpp",
            "gitignore",
            "rust",
        },
        highlight = {
            enbale = true,
            additional_vim_regex_highlightint = false,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- MDX
        vim.filetype.add({
            extension = {
                mdx = "mdx",
            },
        })
        vim.treesitter.language.register("markdown", "mdx");
    end,
}}

