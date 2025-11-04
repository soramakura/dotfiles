return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Search buffers" },
    { "<leader>sb",       function() Snacks.picker.buffers() end, desc = "Search buffers" },
    {
      "<leader>sf",
      function()
        Snacks.picker.files({ hidden = true, ignored = true, follow = true, })
      end,
      desc = "Search files"
    },
    { "<leader>sg", function() Snacks.picker.grep() end,         desc = "Search files by grep" },
    { "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Search buffer by grep" },
    { "<leader>sr", function() Snacks.picker.registers() end,    desc = "Search registers" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,      desc = "Search keymaps" },
    {
      "<leader>st",
      function()
        local filetypes = {}
        for _, ft in ipairs(vim.fn.getcompletion("", "filetype")) do
          table.insert(filetypes, { text = ft })
        end

        Snacks.picker.pick("Filetypes", {
          items = filetypes,
          layout = "select",
          format = "text",
          confirm = function(picker, item)
            picker:close()

            if item.text then
              vim.cmd("set ft=" .. item.text)
            end
          end
        })
      end,
      desc = "Search filetypes"
    },
    { "<leader>sc", function() Snacks.picker.commands() end,                  desc = "Search commands" },
    { "<leader>sh", function() Snacks.picker.help() end,                      desc = "Search help" },
    { "<leader>sC", function() Snacks.picker.colorschemes() end,              desc = "Search colorschemes" },
    { "<leader>sn", function() Snacks.picker.notifications() end,             desc = "Search notifications" },
    { "<leader>sp", function() Snacks.picker.lazy() end,                      desc = "Search plugins" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,               desc = "Search symbols" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,               desc = "Search global diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,        desc = "Search file diagnostics" },

    { "<leader>e",  function() Snacks.explorer() end,                         desc = "Open file browser" },
    { "<leader>lg", function() Snacks.lazygit() end,                          desc = "Open lazygit" },

    { "<leader>gb", function() Snacks.picker.git_branches() end,              desc = "Search git branches" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                desc = "Search git statsu" },
    { "<leader>gt", function() Snacks.picker.git_stash() end,                 desc = "Search git stash" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,              desc = "Search git file commits" },
    { "<leader>gc", function() Snacks.picker.git_log() end,                   desc = "Search git commits" },
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "Search github issues" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "Searchall  github issues" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "Search github pull requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "Search all github pull requests" },

    { "gD",         function() Snacks.picker.lsp_declarations() end,          desc = "Go to declaration" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,           desc = "Go to definition" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,      desc = "Go to definition" },
    { "gi",         function() Snacks.picker.lsp_implementations() end,       desc = "Go to implementation" },
    { "gr",         function() Snacks.picker.lsp_references() end,            desc = "Go to references" },
    { "gai",        function() Snacks.picker.lsp_incoming_calls() end,        desc = "Call incoming" },
    { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,        desc = "Call outgoint" },
  },
  opts = {
    -- disabled modules
    animate = { enabled = false, },
    bufdelete = { enabled = false, },
    dashboard = { enabled = false, },
    dim = { enabled = false, },
    image = { enabled = false, },
    indent = { enabled = false, },
    scratch = { enabled = false, },
    scroll = { enabled = false, },
    terminal = { enabled = false, },
    toggle = { enabled = false, },
    words = { enabled = false, },
    zen = { enabled = false, },

    -- enabled modules
    bigfile = { enabled = true, },
    debug = { enabled = true, },
    explorer = { enabled = true, },
    gh = { enabled = true, },
    git = { enabled = true, },
    gitbrowse = { enabled = true },
    input = { enabled = true, },
    keymap = { enabled = true, },
    layout = { enabled = true, },
    lazygit = { enabled = true, },
    notifier = { enabled = true, },
    notify = { enabled = true, },
    picker = { enabled = true, },
    profiler = { enabled = true, },
    quickfile = { enabled = true, },
    rename = { enabled = true, },
    statuscolumn = { enabled = true, },
  },
  init = function()
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
            .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
          return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
          return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          --@
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        if vim.fn.has("nvim-0.11") == 1 then
          ---@diagnostic disable-next-line: duplicate-set-field
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })
  end,
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}
