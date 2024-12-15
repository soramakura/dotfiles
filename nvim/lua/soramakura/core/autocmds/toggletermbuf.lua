--- @module "toggletermbuf"
local M = {}

--- @class ToggleTermBuf
---
--- @field last_focused_buffer number?
--- @field buf_id number
---
local ToggleTermBuf = {}

--- Remembers the last focused buffer
---
--- This function returns a handle to last focused non-terminal buffer
---
--- @private
--- @return integer
---
function ToggleTermBuf:__set_last_focused_buffer()
  self.last_focused_buffer = vim.api.nvim_get_current_buf()
  return self.last_focused_buffer
end

--- Spawn a new terminal buffer
---
--- This function returns a handle to the terminal buffer
---
--- @private
--- @return integer
---
function ToggleTermBuf:__spawn()
  -- create terminal buffer
  vim.cmd.terminal()

  self.buf_id = vim.api.nvim_get_current_buf()
  return self.buf_id
end

--- Creates a new terminal buffer
---
--- This function returns ToggleTermBuf
---
--- @return ToggleTermBuf
---
function ToggleTermBuf:create()
  self:__set_last_focused_buffer()
  self:__spawn()
  self:close()

  return self
end

--- Opens the ToggleTermBuf
---
function ToggleTermBuf:open()
  if not self.buf_id then
    self:create()
  end

  self:__set_last_focused_buffer()

  vim.api.nvim_set_current_buf(self.buf_id)
  vim.cmd.startinsert()
end

--- Closes the ToggleTermBuf
---
function ToggleTermBuf:close()
  if self.last_focused_buffer then
    vim.api.nvim_set_current_buf(self.last_focused_buffer)
  end
end

--- Returns whether the ToggleTermBuf is open
---
--- @return boolean
---
function ToggleTermBuf:is_open()
  if self.buf_id then
    return vim.api.nvim_get_current_buf() == self.buf_id
  else
    return false
  end
end

--- Toggles the ToggleTermBuf
---
function ToggleTermBuf:toggle()
  if self:is_open() then
    self:close()
  else
    self:open()
  end
end

local function setup_command()
  vim.api.nvim_create_user_command("ToggleTermBuf", function()
    ToggleTermBuf:toggle()
  end, {})
  vim.api.nvim_create_user_command("ToggleTermBufOpen", function()
    ToggleTermBuf:open()
  end, {})
  vim.api.nvim_create_user_command("ToggleTermBufClose", function()
    ToggleTermBuf:close()
  end, {})
end

--- Setup toggletermbuf
---
local function setup()
  setup_command()
end

M.ToggleTermBuf = ToggleTermBuf
M.setup = setup

return M
