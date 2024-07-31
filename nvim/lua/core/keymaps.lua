local set_keymap = vim.keymap.set

local function opts(desc)
    return { desc = desc, noremap = true, silent = true }
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- back to normal mode quickly
set_keymap("i", "jj", "<Esc>", opts("Go to normal mode quickly"))

-- Intuitive Redo
set_keymap("n", "U", "<C-r>", opts("Redo"))

-- Move by screen line
set_keymap("n", "k", "gk", opts("Move up"))
set_keymap("n", "j", "gj", opts("Move down"))
set_keymap("n", "0", "g0", opts("Move to beginning of line"))
set_keymap("n", "^", "g^", opts("Move to beginning of line without whitespaces"))
set_keymap("n", "$", "g$55r", opts("Move to end of line"))

-- Window splitting
set_keymap("n", "<leader>sv", "<C-w>v", opts("Split window vertically"))
set_keymap("n", "<leader>sh", "<C-w>s", opts("Split window horizontally"))

-- Move between windows
set_keymap("n", "<C-h>", "<C-w>h", opts("Move to left window"))
set_keymap("n", "<C-j>", "<C-w>j", opts("Move to bottom window"))
set_keymap("n", "<C-k>", "<C-w>k", opts("Move to top window"))
set_keymap("n", "<C-l>", "<C-w>l", opts("Move to right window"))

-- Tab deletion
set_keymap("n", "<leader><Tab>n", ":tabnew<CR>", opts("Create new tab"))
set_keymap("n", "<leader><Tab>d", ":bd<CR>", opts("Delete current tab"))
set_keymap("n", "<leader><Tab>]", ":bnext<CR>", opts("Move to next tab"))
set_keymap("n", "<leader><Tab>[", ":bprevious<CR>", opts("Move to previous tab"))

-- LSP keymaps
set_keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
set_keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
set_keymap("n", "gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
set_keymap("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
set_keymap("n", "gr", vim.lsp.buf.references, opts("Go to references"))

set_keymap("n", "ge", vim.diagnostic.open_float, opts("Show errors on float window"))
set_keymap("n", "g]", vim.diagnostic.goto_next, opts("Go to next error"))
set_keymap("n", "g[", vim.diagnostic.goto_prev, opts("Go to prev error"))

set_keymap("n", "gn", vim.lsp.buf.rename, opts("Rename the symbol"))
set_keymap("n", "ga", vim.lsp.buf.code_action, opts("Run code action"))
set_keymap("n", "gf", vim.lsp.buf.format, opts("Format code"))

set_keymap("n", "K", vim.lsp.buf.hover, opts("Show popup menu"))
set_keymap("n", "<leader>K", vim.lsp.buf.signature_help, opts("Show signature help"))

set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
set_keymap("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts("Print the list of workspace folder"))

