--- @module "toggletermbuf"
local M = {}

--- @class ToggleTermBuf
---
--- @field buf_id number
--- @field win_id number
--- @field win_config {
---   relative: string,
---   width: integer,
---   height: integer,
---   col: integer,
---   row: integer,
---   style: string,
---   border: string,
--- }
---
local ToggleTermBuf = {}

--- Updates the config of the window
---
--- This function returns the config of the window
---
--- @private
--- @return {
---   relative: string,
---   width: integer,
---   height: integer,
---   col: integer,
---   row: integer,
---   style: string,
---   border: string,
--- }
---
function ToggleTermBuf:__update_win_config()
  if self.win_config == nil then
    self.win_config = {
      relative = "editor",
      style = "minimal",
      border = vim.o.winborder or "rounded",
    }
  end

  self.win_config.width  = math.floor(vim.o.columns * 0.8)
  self.win_config.height = math.floor((vim.o.lines - 2) * 0.8)
  self.win_config.col    = math.floor((vim.o.columns - self.win_config.width) / 2)
  self.win_config.row    = math.floor((vim.o.lines - self.win_config.height) / 2 - 2)

  return self.win_config
end

--- Creates a new buffer
---
--- This function returns a handle to the buffer
---
--- @private
--- @return integer
---
function ToggleTermBuf:__create_buffer()
  self.buf_id = vim.api.nvim_create_buf(false, true)
  return self.buf_id
end

--- Creates a new terminal window
---
--- This function returns a handle to the window
---
--- @private
--- @return integer
---
function ToggleTermBuf:__create_terminal_window()
  if self.win_config == nil then
    self:__update_win_config()
  end

  self.win_id = vim.api.nvim_open_win(self.buf_id, true, self.win_config)

  if vim.bo[self.buf_id].buftype ~= "terminal" then
    vim.cmd.terminal()
  end

  return self.win_id
end

--- Opens the ToggleTermBuf
---
function ToggleTermBuf:open()
  if self.buf_id == nil or not vim.api.nvim_buf_is_valid(self.buf_id) then
    self:__create_buffer()
  end

  self:__create_terminal_window()

  vim.cmd.startinsert()
end

--- Closes the ToggleTermBuf
---
function ToggleTermBuf:close()
  vim.api.nvim_win_hide(self.win_id)
end

--- Returns whether the ToggleTermBuf is open
---
--- @return boolean
---
function ToggleTermBuf:is_open()
  if self.win_id == nil then
    return false
  else
    return vim.api.nvim_win_is_valid(self.win_id)
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

--- Resizes the ToggletermBuf window by match the editor size
---
function ToggleTermBuf:on_resize()
  self:__update_win_config()
  if self:is_open() then
    vim.api.nvim_win_set_config(self.win_id, self.win_config)
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

local function setup_autocmd()
  local group_id = vim.api.nvim_create_augroup("soramakura::config::core::clear-registers", { clear = true })
  vim.api.nvim_create_autocmd("VimResized", {
    group = group_id,
    callback = function()
      ToggleTermBuf:on_resize()
    end,
  })
end

--- Setup toggletermbuf
---
local function setup()
  setup_command()
  setup_autocmd()
end

M.ToggleTermBuf = ToggleTermBuf
M.setup = setup

return M
