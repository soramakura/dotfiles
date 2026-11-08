--- @module "clear-shada"
local M = {}

M.registers_to_clear = {
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
  "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "="
}

--- Clears registers
M.clear_registers = function()
  for i = 1, #M.registers_to_clear do
    vim.fn.setreg(M.registers_to_clear[i], {})
  end
  vim.cmd("wshada!")
end

--- Clears command line history
M.clear_command_history = function()
  vim.fn.histdel("cmd")
  vim.cmd("wshada!")
end

--- Clears search history
M.clear_search_history = function()
  vim.fn.histdel("search")
  vim.cmd("wshada!")
end

--- Clears typed expression history
M.clear_typed_expr_history = function()
  vim.fn.histdel("expr")
  vim.cmd("wshada!")
end

--- Clears input history
M.clear_input_history = function()
  vim.fn.histdel("input")
  vim.cmd("wshada!")
end

--- Clears debug_command history
M.clear_debug_history = function()
  vim.fn.histdel("debug")
  vim.cmd("wshada!")
end

M.clear_all_history = function()
  M.clear_command_history()
  M.clear_search_history()
  M.clear_typed_expr_history()
  M.clear_input_history()
  M.clear_debug_history()
end

-- Clears local marks
M.clear_local_marks = function()
  vim.cmd("delmarks!")
  vim.cmd("wshada!")
end

-- Clears global marks
M.clear_global_marks = function()
  vim.cmd("delmarks A-Z")
  vim.cmd("wshada!")
end

-- Clears numbered marks
M.clear_numbered_marks = function()
  vim.cmd("delmarks 0-9")
  vim.cmd("wshada!")
end

-- Clears numbered marks
M.clear_all_marks = function()
  M.clear_local_marks()
  M.clear_global_marks()
  M.clear_numbered_marks()
end

-- Clears jumplist
M.clear_jumplist = function()
  vim.cmd("clearjumps")
  vim.cmd("wshada!")
end

M.clear_all = function()
  M.clear_registers()
  M.clear_all_history()
  M.clear_all_marks()
  M.clear_jumplist()
end

local clear_target_action_map = {
  ["all"] = M.clear_all,

  ["registers"] = M.clear_registers,

  ["command-history"] = M.clear_command_history,
  ["search-history"] = M.clear_search_history,
  ["expr-history"] = M.clear_typed_expr_history,
  ["input-history"] = M.clear_input_history,
  ["debug-history"] = M.clear_debug_history,
  ["history-all"] = M.clear_all_history,

  ["local-marks"] = M.clear_local_marks,
  ["global-marks"] = M.clear_global_marks,
  ["num-marks"] = M.clear_numbered_marks,
  ["marks-all"] = M.clear_all_marks,

  ["jumplist"] = M.clear_jumplist,
}

--- Dispatch clear actions by an argument.
---
---@param target string
local function dispatch_clear_actions(target)
  if target == nil or target == "" then
    vim.notify("target kind is required", vim.log.levels.ERROR)
    return
  end

  local func = clear_target_action_map[target]
  if func == nil then
    vim.notify("target kind '" .. target .. "' is not valid", vim.log.levels.ERROR)
    return
  end

  func()
end

--- Setup clear-registers
M.setup = function()
  vim.api.nvim_create_user_command("ClearShada", function(opts)
    dispatch_clear_actions(opts.fargs[1])
  end, {
    nargs = 1,
    complete = function()
      return vim.tbl_keys(clear_target_action_map)
    end
  })
end

return M
