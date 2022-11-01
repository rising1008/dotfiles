vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use{'wbthomason/packer.nvim', opt = true}

  use 'cocopon/iceberg.vim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'cohama/lexima.vim'

  use 'preservim/tagbar'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-column-devicons'
  use 'ryanoasis/vim-devicons'

  use {'ellisonleao/glow.nvim'}

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

end)
