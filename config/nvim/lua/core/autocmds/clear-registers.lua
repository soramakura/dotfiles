--- @module "clear-registers"
local M = {}

M.registers_to_clear = {
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
  "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/"
}

--- Clears registers
local function clear_registers()
  for i = 1, #M.registers_to_clear do
    vim.fn.setreg(M.registers_to_clear[i], {})
  end
  vim.cmd("wshada!")
end

--- Setup clear-registers
local function setup()
  vim.api.nvim_create_user_command("ClearRegisters", clear_registers, {})
end

M.clear_registers = clear_registers
M.setup = setup

return M
