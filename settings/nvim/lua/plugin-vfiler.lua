local setup, vfiler = pcall(require, 'vfiler')
if not setup then
  return
end

local configs = {
  options = {
    auto_cd = true,
    auto_resize = true,
    preview = {
      layout = 'floating',
      width = 0,
      height = 0
    },
    keep = true,
    name = 'exp',
    layout = 'left',
    width = 50,
    columns = 'indent,devicons,name,git',
    show_hidden_files = true,
    git = {
      enabled = true,
      untracked = true,
      ignored = true,
    },
  },
}

local path = vim.fn.bufname(vim.fn.bufnr())
if vim.fn.isdirectory(path) ~= 1 then
  path = vim.fn.getcwd()
end
path = vim.fn.fnamemodify(path, ':p:h')

function start()
  vfiler.start(path, configs)
end
