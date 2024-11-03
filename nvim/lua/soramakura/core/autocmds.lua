-- change indentation depending on FileType
local filetype_tabstop = {
  c = 4,
  cpp = 4,
  css = 2,
  html = 2,
  javascript = 2,
  lua = 2,
  markdown = 2,
  rust = 4,
  svelte = 2,
  typescript = 2,
}

local user_filetype_config = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = user_filetype_config,
  callback = function(args)
    local ftts = filetype_tabstop[args.match]
    if ftts then
      vim.opt.tabstop = ftts
      vim.opt.softtabstop = ftts
      vim.opt.shiftwidth = ftts
    else
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4
    end
  end,
})

-- toggle terminal buffer
local toggle_terminal_buffer = function()
  --- Returns whether the buffer is a terminal buffer
  local is_terminal_buffer = function(buffer)
    local name = vim.api.nvim_buf_get_name(buffer)
    return vim.startswith(name, "term://")
  end

  --- Finds the terminal buffer and return its handle
  ---
  --- Returns nil if no terminal buffer is open
  local find_terminal_buffer = function()
    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
      if is_terminal_buffer(buffer) then
        return buffer
      end
    end
    return nil
  end

  --- Opens the terminal buffer
  ---
  --- Creates a new terminal buffer if not terminal buffer is open
  local open_terminal_buffer = function()
    -- Save previous buffer
    vim.g.previously_focused_buffer = vim.api.nvim_get_current_buf()

    local term_buf = find_terminal_buffer()
    if term_buf == nil then
      -- create a new terminal buffer
      vim.api.nvim_command("terminal")
    else
      -- switch to already opened terminal buffer
      vim.api.nvim_set_current_buf(term_buf)
    end

    -- change to insert mode
    vim.api.nvim_command("startinsert")
  end

  --- Switches to the previously focused buffer
  local switch_to_previously_focused_buffer = function()
    vim.api.nvim_set_current_buf(vim.g.previously_focused_buffer)
  end

  local current_buffer = vim.api.nvim_get_current_buf()
  if is_terminal_buffer(current_buffer) then
    switch_to_previously_focused_buffer()
  else
    open_terminal_buffer()
  end
end

vim.api.nvim_create_user_command("ToggleTermBuf", toggle_terminal_buffer, {})

-- clear registers on startup
vim.g.alpha_lower = "abcdefghijklmnopqrstuvwxyz"
vim.g.alpha_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
vim.g.digits = "0123456789"
vim.g.alpha_all = vim.g.alpha_lower .. vim.g.alpha_upper
vim.g.alnum = vim.g.alpha_all .. vim.g.digits

local function clear_registers()
  vim.cmd([[
    for r in split(g:alnum .. '/', '\zs')
      call setreg(r, [])
    endfor
  ]])
end
vim.api.nvim_create_user_command("ClearRegisters", clear_registers, {})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = clear_registers,
})
