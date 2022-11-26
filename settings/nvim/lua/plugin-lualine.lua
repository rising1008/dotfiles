local status, lualine = pcall(require, 'lualine')
if not status then
  print('skip the setup process of lualine.')
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    globalstatus = true
  }
})
