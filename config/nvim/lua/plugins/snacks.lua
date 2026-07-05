local open_filetypes_picker = function()
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
end

local lsp_progress_hook = function()
  ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
  local progress_store = vim.defaulttable()

  vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client then return end

      local progress_params = ev.data.params
      local work_progress = progress_params
          .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
      if type(work_progress) ~= "table" then return end

      local active_tasks = progress_store[client.id]
      for i = 1, #active_tasks + 1 do
        if i == #active_tasks + 1 or active_tasks[i].token == progress_params.token then
          local percentage = (work_progress.kind == "end") and 100 or (work_progress.percentage or 100)
          local detail = work_progress.message and (" **%s**"):format(work_progress.message) or ""

          active_tasks[i] = {
            token = progress_params.token,
            msg = ("[%3d%%] %s%s"):format(percentage, work_progress.title or "", detail),
            done = (work_progress.kind == "end"),
          }
          break
        end
      end

      ---@type string[]
      local displayed_msgs = {}
      progress_store[client.id] = vim.tbl_filter(function(task)
        table.insert(displayed_msgs, task.msg)
        return not task.done
      end, active_tasks)

      -- local mode = vim.api.nvim_get_mode().mode
      -- if (mode == "i" or mode == "R") then
      --   return
      -- end

      vim.notify(table.concat(displayed_msgs, "\n"), vim.log.levels.INFO, {
        id = "lsp_progress",
        title = client.name,
        icon = (#progress_store[client.id] == 0) and " " or "󰔟"
      })
    end,
  })
end

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
    { "<leader>sg", function() Snacks.picker.grep() end,                      desc = "Search files by grep" },
    { "<leader>sG", function() Snacks.picker.grep_buffers() end,              desc = "Search buffer by grep" },
    { "<leader>sr", function() Snacks.picker.registers() end,                 desc = "Search registers" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                   desc = "Search keymaps" },
    { "<leader>st", open_filetypes_picker,                                    desc = "Search filetypes" },
    { "<leader>sc", function() Snacks.picker.commands() end,                  desc = "Search commands" },
    { "<leader>sh", function() Snacks.picker.help() end,                      desc = "Search help pages" },
    { "<leader>sC", function() Snacks.picker.colorschemes() end,              desc = "Search colorschemes" },
    { "<leader>sn", function() Snacks.picker.notifications() end,             desc = "Search notifications" },
    { "<leader>sp", function() Snacks.picker.lazy() end,                      desc = "Search plugins" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,               desc = "Search symbols" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,               desc = "Search global diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,        desc = "Search file diagnostics" },
    { "<leader>sm", function() Snacks.picker.marks() end,                     desc = "Search marks" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                     desc = "Search jumplist" },
    { "<leader>si", function() Snacks.picker.icons() end,                     desc = "Search icons" },

    { "<leader>e",  function() Snacks.explorer() end,                         desc = "Open file browser" },
    { "<leader>lg", function() Snacks.lazygit() end,                          desc = "Open lazygit" },

    { "<leader>gb", function() Snacks.picker.git_branches() end,              desc = "Search git branches" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                desc = "Search git status" },
    { "<leader>gt", function() Snacks.picker.git_stash() end,                 desc = "Search git stash" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,              desc = "Search git file commits" },
    { "<leader>gc", function() Snacks.picker.git_log() end,                   desc = "Search git commits" },
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "Search github issues" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "Searchall  github issues" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "Search github pull requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "Search all github pull requests" },
    { "<leader>sM", function() Snacks.picker.man() end,                       desc = "Search man pages" },

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
    image = { enabled = true, },
    input = { enabled = true, },
    keymap = { enabled = true, },
    layout = { enabled = true, },
    lazygit = { enabled = true, },
    notifier = { enabled = true, },
    notify = { enabled = true, },
    picker = {
      enabled = true,
      layouts = {
        my_custom_picker = {
          preset = "default",
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 60,
            height = 0.8,
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              { win = "input", height = 1,     border = "bottom" },
              { win = "list",  border = "none" },
            },
            { win = "preview", title = "{preview}", border = true, width = 0.45 },
          },
        },
      },
      sources = {
        buffers = { layout = "my_custom_picker", },
        files = { layout = "my_custom_picker", },
        grep = { layout = "my_custom_picker", },
        grep_buffers = { layout = "my_custom_picker", },
        registers = { layout = "my_custom_picker", },
        keymaps = { layout = "my_custom_picker", },
        commands = { layout = "my_custom_picker", },
        help = { layout = "my_custom_picker", },
        colorschemes = { layout = "my_custom_picker", },
        notifications = { layout = "my_custom_picker", },
        lazy = { layout = "my_custom_picker", },
        lsp_symbols = { layout = "my_custom_picker", },
        diagnostic = { layout = "my_custom_picker", },
        diagnostics_buffer = { layout = "my_custom_picker", },
        marks = { layout = "my_custom_picker", },
        jumps = { layout = "my_custom_picker", },
        icons = { layout = "select", },
        git_branches = { layout = "my_custom_picker", },
        git_status = { layout = "my_custom_picker", },
        git_stash = { layout = "my_custom_picker", },
        git_log_file = { layout = "my_custom_picker", },
        git_log = { layout = "my_custom_picker", },
        gh_issue = { layout = "my_custom_picker", },
        gh_pr = { layout = "my_custom_picker", },
        man = { layout = "my_custom_picker", },
        lsp_declarations = { layout = "my_custom_picker", },
        lsp_definitions = { layout = "my_custom_picker", },
        lsp_type_definitions = { layout = "my_custom_picker", },
        lsp_implementations = { layout = "my_custom_picker", },
        lsp_references = { layout = "my_custom_picker", },
        lsp_incoming_calls = { layout = "my_custom_picker", },
        lsp_outgoing_calls = { layout = "my_custom_picker", },
      },
    },
    profiler = { enabled = true, },
    quickfile = { enabled = true, },
    rename = { enabled = true, },
    statuscolumn = { enabled = true, },
  },
  init = function()
    lsp_progress_hook()

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
}
