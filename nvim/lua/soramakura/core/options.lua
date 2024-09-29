-- charset
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }

-- prevent full-width characters from being drawn with the width of half-width characters
vim.opt.ambiwidth = "double"

-- Automatically read files when they are modified by other programs
vim.opt.autoread = true

-- hidden unloaded buffer
vim.opt.hidden = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

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

-- backspace
vim.opt.backspace = "indent,eol,start"

-- use mouse
vim.opt.mouse = "a"
vim.opt.title = true

-- show column to display sign
vim.opt.signcolumn = "yes"

-- enable cursorline
vim.opt.cursorline = true

-- turn on termguicolors for beautiful colorscheme to work
vim.opt.termguicolors = true

-- status line
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = true

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- prevent creation of swap files
vim.opt.swapfile = false

-- save undo history
vim.opt.undofile = true

-- set update time
vim.opt.updatetime = 250

-- set timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300
