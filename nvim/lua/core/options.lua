local opt = vim.opt

-- charset
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencodings = { 'utf-8', 'ucs-bom', 'cp932', 'default' }
opt.fileencoding = 'utf-8'
opt.autoread = true

-- prevent full-width characters from being drawn with the width of half-width characters
opt.ambiwidth = 'double'

-- indent settings
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- highlight settings
opt.cursorline = true
opt.signcolumn = 'yes'
opt.hlsearch = true
opt.showmatch = true
opt.syntax = 'yes'

-- searching settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true

-- clipbard settings
opt.clipboard = 'unnamedplus'

-- use mouse
opt.mouse = 'a'
opt.title = true

-- show line numbers
opt.number = true

-- show control characters
opt.list = true
opt.listchars = {
    tab = '»-',
    -- eol = '¬',
    trail = '･',
    extends = '»',
    precedes = '«',
}

opt.laststatus = 2
opt.cmdheight = 2
opt.showcmd = true

-- do not generate backup and swap file
opt.backup = false
opt.swapfile = false
opt.hidden = true

-- others
opt.helplang = { 'ja', 'en' }
opt.confirm = true
opt.termguicolors = true
opt.updatetime = 300

