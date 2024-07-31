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

