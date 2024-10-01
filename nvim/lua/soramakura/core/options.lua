-- charset
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }

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
vim.opt.matchtime = 0

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

-- show control characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "»-",
  space = "･",
  extends = "»",
  precedes = "«",
}

-- turn on termguicolors for beautiful colorscheme to work
vim.opt.termguicolors = true

-- status line
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = true

-- allow to choose whether to save the buffer when exiting
vim.opt.confirm = true

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

-- enable Japanese help
vim.opt.helplang = { "ja", "en" }

-- When running on Windows, change the shell from cmd.exe to powershell
vim.opt.termguicolors = true
if vim.loop.os_uname().sysname == "Windows_NT" then
  local pwsh_options = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for k, v in pairs(pwsh_options) do
    vim.opt[k] = v
  end
end

-- add frame to the hover window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- prevent full-width characters from being drawn with the width of half-width characters
vim.opt.ambiwidth = "double"
-- prevent layout collapse caused by `ambiwidth="double"`
local cellwidths = vim.fn.getcellwidths()
table.insert(cellwidths, { 0x2600, 0x26ff, 1 })
table.insert(cellwidths, { 0xe5fa, 0xe6ac, 1 })
table.insert(cellwidths, { 0xe700, 0xe7c5, 1 })
table.insert(cellwidths, { 0xf000, 0xf2e0, 1 })
table.insert(cellwidths, { 0xe200, 0xe2a9, 1 })
table.insert(cellwidths, { 0xf0001, 0xf1af0, 1 })
table.insert(cellwidths, { 0xe300, 0xe3e3, 1 })
table.insert(cellwidths, { 0xf400, 0xf532, 1 })
table.insert(cellwidths, { 0xe0a0, 0xe0a2, 1 })
table.insert(cellwidths, { 0xe0b0, 0xe0b3, 1 })
table.insert(cellwidths, { 0xe0a3, 0xe0a3, 1 })
table.insert(cellwidths, { 0xe0b4, 0xe0c8, 1 })
table.insert(cellwidths, { 0xe0ca, 0xe0ca, 1 })
table.insert(cellwidths, { 0xe0cc, 0xe0d4, 1 })
table.insert(cellwidths, { 0x23fb, 0x23fe, 1 })
table.insert(cellwidths, { 0x2b58, 0x2b58, 1 })
table.insert(cellwidths, { 0xf300, 0xf32f, 1 })
table.insert(cellwidths, { 0xe000, 0xe00a, 1 })
table.insert(cellwidths, { 0xea60, 0xebeb, 1 })
table.insert(cellwidths, { 0x276c, 0x2771, 1 })
table.insert(cellwidths, { 0x2500, 0x259f, 1 })
vim.fn.setcellwidths(cellwidths)
