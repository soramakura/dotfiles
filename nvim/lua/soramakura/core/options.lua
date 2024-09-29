-- charset
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }

-- prevent full-width characters from being drawn with the width of half-width characters
vim.opt.ambiwidth = "double"

-- hidden unloaded buffer
vim.opt.hidden = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- show column to display sign
vim.opt.signcolumn = "yes"

-- tab and indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- disable line wrapping
vim.opt.wrap = false

-- enable syntax highlighting
vim.opt.syntax = "yes"

-- highlight matching brackets
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- searching settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true

-- use sysmtem clipboard as default register
vim.opt.clipboard:append("unnamedplus")

-- use mouse
vim.opt.mouse = "a"
vim.opt.title = true

-- status line
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = true

-- prevent creation of swap files
vim.opt.swapfile = false
