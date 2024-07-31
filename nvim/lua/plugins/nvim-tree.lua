return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "VimEnter" },
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
            highlight_git = true,
            highlight_opened_files = "name",
            icons = {
                glyphs = {
                    git = {
                        unstaged = "!",
                        renamed = "»",
                        untracked = "?",
                        deleted = "✘",
                        staged = "✓",
                        unmerged = "",
                        ignored = "◌",
                    },
                },
            },
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

        require("nvim-tree.api").tree.toggle({ find_file = false, update_root = false, focus = false })
        require("nvim-tree.api").tree.close()

        vim.api.nvim_set_keymap("n", "<C-e>", "<CMD>NvimTreeToggle<CR>", { silent = true })
    end,
}
