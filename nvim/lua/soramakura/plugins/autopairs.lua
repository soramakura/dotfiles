return {
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {
      disable_in_macro = false,
      check_ts = true,
      map_cr = true,
      map_bs = true,
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)
      autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- add spaces between parenthses
      local rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      autopairs.add_rules {
        rule(' ', ' ')
            :with_pair(function(options)
              local pair = options.line:sub(options.col - 1, options.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2]
              }, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(function(options)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local context = options.line:sub(col - 1, col + 2)
              return vim.tbl_contains({
                brackets[1][1] .. '  ' .. brackets[1][2],
                brackets[2][1] .. '  ' .. brackets[2][2],
                brackets[3][1] .. '  ' .. brackets[3][2]
              }, context)
            end)
      }
      for _, bracket in pairs(brackets) do
        autopairs.add_rules {
          rule(bracket[1] .. ' ', ' ' .. bracket[2])
              :with_pair(cond.none())
              :with_move(function(options) return options.char == bracket[2] end)
              :with_del(cond.none())
              :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
              :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
        }
      end
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
  },
}
