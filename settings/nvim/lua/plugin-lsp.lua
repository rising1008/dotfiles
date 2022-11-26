local setup, lsp = pcall(require, 'lsp')
if not setup then
  print('skip the setup process of lsp')
  return
end
