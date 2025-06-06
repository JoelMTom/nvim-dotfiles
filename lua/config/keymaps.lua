local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap <ESC>
keymap("i", "jk", "<ESC>", opts)
keymap("", "<space>", "<Nop>", opts)

--navigation
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "j", "jzz")
-- vim.keymap.set("n", "k", "kzz")

-- Pane navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Window navigation
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
-- keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- visual movements
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Window resize
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- visual editing
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
