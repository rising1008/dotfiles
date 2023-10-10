vim.g['fern#renderer'] = 'nvim-web-devicons'
print('fern#renderer: ' .. vim.g['fern#renderer'])
vim.g['fern#default_hidden'] = 1

vim.cmd([[
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END
]])

vim.g["glyph_palette#palette"] = require'fr-web-icons'.palette()