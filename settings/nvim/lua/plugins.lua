-- auto install packer if not installed
local check_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = check_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

require'packer'.startup(function()
  -- packer can manage itself
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  -- localize docs of vim
  use 'vim-jp/vimdoc-ja'

  -- manage a theme 
  use 'cocopon/iceberg.vim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind-nvim'

  use 'cohama/lexima.vim'

  use {'preservim/tagbar'}

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-column-devicons'
  use 'ryanoasis/vim-devicons'

  use {'ellisonleao/glow.nvim'}

  use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'voldikss/vim-floaterm'
  }

  use {
    'kamykn/spelunker.vim'
  }
  --use ({
  --  'folke/noice.nvim',
  --  config = function()
  --    require('noice').setup()
  --  end,
  --  requires = {
  --    'MunifTanjim/nui.nvim',
  --    'rcarriga/nvim-notify'
  --  }
  --})
  if packer_bootstrap then
    require('packer').sync()
  end
end)
