local opt = vim.opt

-- disable netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwSetings = true
vim.g.loaded_netrwFileHandlers = true

-- charset
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }
opt.fileencoding = "utf-8"
opt.autoread = true

-- prevent full-width characters from being drawn with the width of half-width characters
opt.ambiwidth = "double"

-- indent settings
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- highlight settings
opt.cursorline = true
opt.signcolumn = "yes"
opt.hlsearch = true
opt.showmatch = true
opt.syntax = "yes"

-- searching settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true

-- clipbard settings
opt.clipboard = "unnamedplus"

-- use mouse
opt.mouse = "a"
opt.title = true

-- show line numbers
opt.number = true
opt.relativenumber = true

-- show control characters
opt.list = true
opt.listchars = {
  tab = "»-",
  -- eol = "¬",
  space = "･",
  extends = "»",
  precedes = "«",
}

opt.laststatus = 3
opt.cmdheight = 1
opt.showcmd = true

-- do not generate backup and swap file
opt.backup = false
opt.swapfile = false
opt.hidden = true
opt.undofile = true

-- timeout
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- others
opt.helplang = { "ja", "en" }
opt.confirm = true
opt.termguicolors = true
