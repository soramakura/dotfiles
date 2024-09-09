return {
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-nvim-lua",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-path",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-buffer",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "saecki/crates.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = function()
      local cmp = require("cmp")
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
          { name = "crates" }
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
          ["<C-h>"] = cmp.mapping.abort(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-l>"] = cmp.mapping.complete(),
          -- 一応別のキーマップも割り当てる
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "NLSP",
              buffer   = "BUFF",
              path     = "PATH",
              cmdline  = "CMDL",
              luasnip  = "LSNP",
              nvim_lua = "NLUA",
              crates   = "CRTS",
            }
            item.menu = menu_icon[entry.source.name]

            -- local fixed_width = 50
            -- local content = item.abbr
            -- if fixed_width then
            --   vim.o.pumwidth = fixed_width
            -- end

            -- local win_width = vim.api.nvim_win_get_width(0)
            -- local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

            -- if #content > max_content_width then
            --   item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
            -- else
            --   item.abbr = content .. (" "):rep(max_content_width - #content)
            -- end
            return item
          end,
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      cmp.setup(opts)

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
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
  },
}
