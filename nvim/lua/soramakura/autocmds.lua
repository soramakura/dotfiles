-- Change indentation depending on FileType
local filetype_tabstop = {
  lua = 2,
  markdown = 2,
  rust = 4,
  cpp = 4,
  c = 4,
}

local usrftcfg = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = usrftcfg,
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
