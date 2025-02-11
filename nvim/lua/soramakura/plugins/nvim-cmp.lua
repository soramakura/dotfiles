return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    {
      "saecki/crates.nvim",
      tag = "stable",
      opts = {},
    },
    "onsails/lspkind.nvim",
  },
  opts = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    return {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "crates" },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-2),
        ["<C-d>"] = cmp.mapping.scroll_docs(2),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          maxwidth = {
            menu = function()
              return math.floor(0.45 * vim.o.columns)
            end,
            abbr = function()
              return math.floor(0.45 * vim.o.columns)
            end,
          },
          ellipsis_char = "...",
          show_labelDetails = true,
        }),
      },
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      source = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
