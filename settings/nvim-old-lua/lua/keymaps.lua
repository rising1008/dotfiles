vim.g.mapleader = '\\'

local keymap = vim.keymap

---------------------
-- general keymaps
---------------------

keymap.set('i', 'jj', '<ESC>', {silent=true})

keymap.set('n', '<leader>nh', ':nohl<CR>')

keymap.set('n', '<C-n>', ':<C-u>setlocal relativenumber!<CR>', {silent=true})

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

---------------------
-- pugins keymaps
---------------------

-- vfiler
keymap.set('n', '<C-e>', ':call v:lua.start()<CR>', {silent=true})
keymap.set('n', '<C-f>', '<Cmd> VFiler -layout=floating -name=explore<CR>', {silent=true})

-- tagbar
keymap.set('n', '<C-t>', ':TagbarToggle<CR>')
