-- vim.g.mapleader = '\\'
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- general keymaps
---------------------

keymap.set("i", "jj", "<ESC>", { silent = true })

-- keymap.set('n', '<leader>nh', ':nohl<CR>')

-- relativenumber を切り替える
keymap.set("n", "<C-n>", ":<C-u>setlocal relativenumber!<CR>", { silent = true })
-- ビジュアルモードでハイライト行を纏めて移動する
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- allows search terms to stay in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true })

-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
--
-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

