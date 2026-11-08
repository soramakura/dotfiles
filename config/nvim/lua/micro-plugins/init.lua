local M = {}

M.setup = function()
  require("micro-plugins.clear-shada").setup()
  require("micro-plugins.filetype-indent").setup()
  require("micro-plugins.toggletermbuf").setup()
end

return M
