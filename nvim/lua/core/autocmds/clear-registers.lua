-- @module "clear-registers"
local M = {}

M.registers_to_clear = {
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
  "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
  "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
}

--- Clears registers
---
local function clear_registers()
  for i = 1, #M.registers_to_clear do
    vim.fn.setreg(M.registers_to_clear[i], {})
  end
end

local function setup_autocmds()
  local group_id = vim.api.nvim_create_augroup("soramakura::config::core::clear-registers", { clear = true })
  vim.api.nvim_create_autocmd("VimEnter", {
    group = group_id,
    callback = clear_registers,
  })
end

local function setup_commands()
  vim.api.nvim_create_user_command("ClearRegisters", clear_registers, {})
end

--- Setup clear-registers
---
local function setup()
  setup_autocmds()
  setup_commands()
end

M.clear_registers = clear_registers
M.setup = setup

return M
