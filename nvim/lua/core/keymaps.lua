local set_keymap = vim.api.nvim_set_keymap

local function opts(desc)
    return { desc = desc, noremap = true, silent = true }
end

local default_opts = { silent = true, noremap = true}

vim.g.mapleader = ' '

-- 素早くノーマルモードに戻る
set_keymap('i', 'jj', '<Esc>', { silent = true })

-- 表示行で移動
set_keymap('n', 'k', 'gk', default_opts)
set_keymap('n', 'j', 'gj', default_opts)
set_keymap('n', '0', 'g0', default_opts)
set_keymap('n', '^', 'g^', default_opts)
set_keymap('n', '$', 'g$55r', default_opts)

-- ウィンドウ分割系
set_keymap('n', '<leader>sv', '<C-w>v', opts('split window vertically'))
set_keymap('n', '<leader>sh', '<C-w>s', opts('split window horizontally'))

-- ウィンドウ間の移動
set_keymap('n', '<C-h>', '<C-w>h', opts('move to left window'))
set_keymap('n', '<C-j>', '<C-w>j', opts('move to bottom window'))
set_keymap('n', '<C-k>', '<C-w>k', opts('move to top window'))
set_keymap('n', '<C-l>', '<C-w>l', opts('move to right window'))

-- タブの削除
set_keymap('n', '<leader><Tab><Tab>', ':tabnew<CR>', opts('create new tab'))
set_keymap('n', '<leader><Tab>d', ':bd<CR>', opts('delete current tab'))
set_keymap('n', '<leader><Tab>]', ':bnext<CR>', opts('move to next tab'))
set_keymap('n', '<leader><Tab>[', ':bprevious<CR>', opts('move to previous tab'))

-- LSPに関連するキーマップ
local lsp_opts = { noremap = true, silent = true }

set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', lsp_opts)
set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', lsp_opts)
set_keymap('n', 'gt', '<CMD>lua vim.lsp.buf.type_definition()<CR>', lsp_opts)
set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', lsp_opts)
set_keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', lsp_opts)

set_keymap('n', '<leader>rn', '<CMD>lua vim.lsp.buf.rename()<CR>', lsp_opts)
set_keymap('n', '<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<CR>', lsp_opts)
set_keymap('n', '<leader>cf', '<CMD>lua vim.lsp.buf.format()<CR>', lsp_opts)

set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', lsp_opts)
set_keymap('n', '<C-k>', '<CMD>lua vim.lsp.buf.signature_help()<CR>', lsp_opts)

set_keymap('n', '<leader>wa', '<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>', lsp_opts)
set_keymap('n', '<leader>wr', '<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>', lsp_opts)
set_keymap('n', '<leader>wl', '<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', lsp_opts)

