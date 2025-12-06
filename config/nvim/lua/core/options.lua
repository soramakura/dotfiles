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
-- default indentation options used before opening a buffer with a given file type
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- enable line wrapping
vim.opt.wrap = true

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

-- lazy sync of system clipboard and default registers
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.schedule(function()
      vim.opt.clipboard:append("unnamedplus")
    end)
  end,
})

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

-- enable English help
vim.opt.helplang = { "en" }

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

-- border settings
vim.o.winborder = "rounded"

-- prevent two-width characters from being displayed in one-width.
vim.opt.ambiwidth = "single"
-- set the width of characters that are not displayed properly by default.
local cellwidths = vim.fn.getcellwidths()
local ambiwidth_excepts = {
  -- single width
  { 0x00c0,  0x024f,  1 },
  { 0x1e00,  0x1eff,  1 },
  { 0x2500,  0x259f,  1 },
  { 0x2768,  0x2775,  1 },
  { 0x2b58,  0x2b58,  1 },
  { 0xe000,  0xe00a,  1 },
  { 0xe0a0,  0xe0a3,  1 },
  { 0xe0b0,  0xe0c8,  1 },
  { 0xe0ca,  0xe0ca,  1 },
  { 0xe0cc,  0xe0d4,  1 },
  { 0xe200,  0xe2a9,  1 },
  { 0xe300,  0xe3e3,  1 },
  { 0xe5fa,  0xe6ac,  1 },
  { 0xe700,  0xe7c5,  1 },
  { 0xea60,  0xebeb,  1 },
  { 0xf000,  0xf2e0,  1 },
  { 0xf300,  0xf32f,  1 },
  { 0xf400,  0xf532,  1 },
  { 0xf0001, 0xf1af0, 1 },

  -- double width
  { 0x2160, 0x2188, 2 },
  { 0x2300, 0x23f1, 2 },
  { 0x23f3, 0x24ff, 2 },
  { 0x2600, 0x2767, 2 },
  { 0x2776, 0x27ff, 2 },
  { 0x2900, 0x297f, 2 },
  { 0x2b00, 0x2b57, 2 },
  { 0x2b59, 0x2bff, 2 },
  { 0x1f300, 0x1faff, 2 },
}
for i = 1, #ambiwidth_excepts do
  table.insert(cellwidths, ambiwidth_excepts[i])
end
vim.fn.setcellwidths(cellwidths)
