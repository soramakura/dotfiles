-- charset
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }

-- prevent full-width characters from being drawn with the width of half-width characters
vim.opt.ambiwidth = "double"

-- tab and indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
