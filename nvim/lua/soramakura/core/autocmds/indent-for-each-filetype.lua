--- @module "indent-for-each-filetype"
local M = {}

M.default_indent_width = 4

--- @type { [string]: { indent: number, expandtab: boolean } }
M.indent_for_each_filetype = {
  c = { indent = 4, expandtab = true },
  cpp = { indent = 4, expandtab = true },
  css = { indent = 2, expandtab = true },
  gitconfig = "<Tab>",
  html = 2,
  javascirpt = 2,
  lua = 2,
  make = "<Tab>",
  markdown = 2,
  rust = 4,
  svelte = 2,
  typescript = 2,
}

local function set_indent_style_by_filetype(filetype)
  local indent_style = M.indent_for_each_filetype[filetype]

  if type(indent_style) == "string" and string.lower(indent_style) == "<tab>" then
    vim.opt.expandtab = false
    vim.opt.tabstop = M.default_indent_width
    vim.opt.softtabstop = M.default_indent_width
    vim.opt.shiftwidth = M.default_indent_width
  elseif type(indent_style) == "number" then
    vim.opt.expandtab = true
    vim.opt.tabstop = indent_style
    vim.opt.softtabstop = indent_style
    vim.opt.shiftwidth = indent_style
  else
    vim.opt.expandtab = true
    vim.opt.tabstop = M.default_indent_width
    vim.opt.softtabstop = M.default_indent_width
    vim.opt.shiftwidth = M.default_indent_width
  end
end

local function setup_autocmds()
  local group_id = vim.api.nvim_create_augroup("soramakura::config::core::indent", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group_id,
    callback = function(args)
      set_indent_style_by_filetype(args.match)
    end,
  })
end

-- Setup indent
local function setup()
  setup_autocmds()
end

M.setup = setup

return M
