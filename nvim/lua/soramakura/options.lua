local opt = vim.opt

-- charset
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "cp932", "default" }
opt.fileencoding = "utf-8"
opt.autoread = true
opt.fileformats = { "unix", "dos", "mac" }

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

-- terminal
opt.termguicolors = true
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
    opt[k] = v
  end
end

-- others
opt.helplang = { "ja", "en" }
opt.confirm = true
