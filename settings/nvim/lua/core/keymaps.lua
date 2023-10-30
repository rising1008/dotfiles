local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap

-- vim.g.mapleader = '\\'
vim.g.mapleader = " "

keymap.set("i", "jj", "<ESC>", opts)
-- relativenumber を切り替える
keymap.set("n", "<C-n>", ":<C-u>setlocal relativenumber!<CR>", { silent = true })
-- ビジュアルモードでハイライト行を纏めて移動する
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("v", "p", '"_dP', opts)
-- allows search terms to stay in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
-- window resize
keymap.set("n", "<C-r>h", ":resize -2<CR>", opts)
keymap.set("n", "<C-r>j", ":resize +2<CR>", opts)
keymap.set("n", "<C-r>k", ":vertical -2<CR>", opts)
keymap.set("n", "<C-r>l", ":vertical +2<CR>", opts)

-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
-- tab navigation
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
