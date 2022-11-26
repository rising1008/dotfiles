local opt = vim.opt

-- messages
opt.shortmess = 'I'

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

-- backspace
opt.backspace = 'indent,eol,start'

-- clipboard
opt.clipboard = 'unnamedplus'

-- mouse
opt.mouse = 'a'

-- split windows
opt.splitright = true
opt.splitbelow = true

-- bell
opt.visualbell = false
opt.errorbells = false

-- folding

opt.foldmethod = 'indent'
opt.foldlevel = 2
opt.foldcolumn = '3'

-- spell check
opt.spell = false

opt.modifiable = true
opt.whichwrap = 'b,s,[,],<,>'
opt.ambiwidth = 'single'
opt.wildmenu = true
opt.cmdheight = 1
opt.laststatus = 3
opt.showcmd = true
opt.hlsearch = true
opt.showtabline = 2
opt.showmode = false
opt.winblend = 20
opt.pumblend = 20

opt.swapfile = false
opt.backup = false
opt.undofile = false

opt.updatetime = 300

opt.fileencoding = 'utf-8'

opt.list = true
--opt.listchars = 'tab:-\,tail:.'

opt.textwidth = 0
