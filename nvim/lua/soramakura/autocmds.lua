-- Change indentation depending on FileType
local filetype_tabstop = {
  c = 4,
  cpp = 4,
  css = 2,
  html = 2,
  javascript = 2,
  typescript = 2,
  svelte = 2,
  lua = 2,
  markdown = 2,
  rust = 4,
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

-- Clear registers on startup
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
