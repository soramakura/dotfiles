-- setup indent-for-each-filetype
require("core.autocmds.indent-for-each-filetype").setup()

-- setup clear-register
require("core.autocmds.clear-registers").setup()

-- setup toggletermbuf
require("core.autocmds.toggletermbuf").setup()

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "https://*", "http://*" },
  group = vim.api.nvim_create_augroup(
    "soramakura::config::core::openbrowser",
    { clear = true }
  ),
  callback = function(args)
    vim.ui.open(args.match)
    vim.cmd([[e # | bdelete #]])
  end
})
