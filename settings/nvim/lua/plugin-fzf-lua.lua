require'fzf-lua'.setup({
    winopts = {
      -- window height
      height     = 0.85,
      -- window width
      width      = 0.80,
      -- window row position (0=top, 1=bottom)
      row        = 0.35,
      -- window col position (0=left, 1=right)
      col        = 0.50,
      -- 'none', 'single', 'double', 'thicc' or 'rounded'
      border     = 'rounded',
      -- start fullscreen?
      fullscreen = false
    }
  })

vim.cmd ([[
  highlight FzfLuaNormal guibg=#383850
  highlight FzfLuaBorder guibg=#383850
]])

vim.opt.winblend = 5
vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>")
vim.keymap.set('n', '<leader>g', "<cmd>lua require('fzf-lua').git_status()<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').git_branches()<CR>")
vim.keymap.set('n', '<leader>p', "<cmd>lua require('fzf-lua').grep()<CR>")
vim.keymap.set('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>")

vim.keymap.set('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
vim.keymap.set('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>")
vim.keymap.set('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').diagnostics_document()<CR>")