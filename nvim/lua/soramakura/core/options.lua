-- charset
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }

-- prevent full-width characters from being drawn with the width of half-width characters
vim.opt.ambiwidth = "double"
