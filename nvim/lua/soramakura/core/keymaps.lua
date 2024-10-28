local set_keymap = vim.keymap.set
local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- back to normal mode quickly
set_keymap("i", "jj", "<Esc>", opts("Exit normal mode quickly"))
set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts("Exit terminal mode quickly"))

-- toggle terminal buffer
set_keymap("n", "<A-s>", "<CMD>ToggleTermBuf", opts("Toggle terminal buffer"))

-- intuitive Redo
set_keymap("n", "U", "<C-r>", opts("Redo"))

-- disappear search text highlighting
set_keymap("n", "<Esc>", "<CMD>nohlsearch<CR>", opts("Disappear search text highlighting"))

-- move by screen line
set_keymap("n", "k", "gk", opts("Move up"))
set_keymap("n", "j", "gj", opts("Move down"))
set_keymap("n", "0", "g0", opts("Move to beginning of line"))
set_keymap("n", "^", "g^", opts("Move to beginning of line without whitespaces"))
set_keymap("n", "$", "g$", opts("Move to end of line"))

-- window splitting
set_keymap("n", "<leader>wv", "<C-w>v", opts("Split window vertically"))
set_keymap("n", "<leader>wh", "<C-w>s", opts("Split window horizontally"))
set_keymap("n", "<leader>wc", "<C-w>c", opts("Close window"))
set_keymap("n", "<leader>wd", "<C-w>c", opts("Close window"))
set_keymap("n", "<leader>we", "<C-w>=", opts("Make windows the same size"))

-- move between windows
set_keymap("n", "<C-j>", "<C-w>j", opts("Move to bottom window"))
set_keymap("n", "<C-k>", "<C-w>k", opts("Move to top window"))
set_keymap("n", "<C-h>", "<C-w>h", opts("Move to left window"))
set_keymap("n", "<C-l>", "<C-w>l", opts("Move to right window"))

-- resize windows
set_keymap("n", "<C-Up>", "<C-w>+", opts("Increase window height"))
set_keymap("n", "<C-Down>", "<C-w>-", opts("Decrease window height"))
set_keymap("n", "<C-Left>", "<C-w><", opts("Decrease window width"))
set_keymap("n", "<C-Right>", "<C-w>>", opts("Increase window width"))

-- control buffers
set_keymap("n", "[b", "<CMD>bprevious<CR>", opts("Move to previous buffer"))
set_keymap("n", "]b", "<CMD>bnext<CR>", opts("Move to next buffer"))
set_keymap("n", "<leader>b^", "<CMD>bfirst<CR>", opts("Move to first buffer"))
set_keymap("n", "<leader>b$", "<CMD>blast<CR>", opts("Move to last buffer"))

set_keymap("n", "<leader>bn", "<CMD>tabnew<CR><CMD>tabclose<CR><CMD>bnext<CR>", opts("Create new buffer"))
set_keymap("n", "<leader>bd", "<CMD>bdelete<CR>", opts("Delete current buffer"))
set_keymap("n", "<leader>bw", "<CMD>bwipeout<CR>", opts("Wipeout current buffer"))

-- control tabs
set_keymap("n", "<leader><Tab>[", "<CMD>tabprevious<CR>", opts("Move to previous tab"))
set_keymap("n", "<leader><Tab>]", "<CMD>tabnext<CR>", opts("Move to next tab"))
set_keymap("n", "<leader><Tab>f", "<CMD>tabfirst<CR>", opts("Move to first tab"))
set_keymap("n", "<leader><Tab>l", "<CMD>tablast<CR>", opts("Move to last tab"))

set_keymap("n", "<leader><Tab>n", "<CMD>tabnew<CR>", opts("Create new tab"))
set_keymap("n", "<leader><Tab>d", "<CMD>tabclose<CR>", opts("Close current tab"))
set_keymap("n", "<leader><Tab>o", "<CMD>tabonly<CR>", opts("Close other tabs"))

-- lsp keymaps
set_keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
set_keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
set_keymap("n", "gy", vim.lsp.buf.type_definition, opts("Go to type definition"))
set_keymap("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
set_keymap("n", "gr", vim.lsp.buf.references, opts("Go to references"))

set_keymap("n", "<leader>D", vim.diagnostic.open_float, opts("Show errors on float window"))
set_keymap("n", "g]", vim.diagnostic.goto_next, opts("Go to next error"))
set_keymap("n", "g[", vim.diagnostic.goto_prev, opts("Go to prev error"))
set_keymap("n", "]d", vim.diagnostic.goto_next, opts("Go to next error"))
set_keymap("n", "[d", vim.diagnostic.goto_prev, opts("Go to prev error"))

set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename the symbol"))
set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts("Run code action"))
set_keymap("n", "<leader>f", vim.lsp.buf.format, opts("Format code"))

set_keymap("n", "K", vim.lsp.buf.hover, opts("Show popup menu"))
set_keymap("n", "<leader>k", vim.lsp.buf.signature_help, opts("Show signature help"))

set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
set_keymap("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
  opts("Print the list of workspace folder"))
