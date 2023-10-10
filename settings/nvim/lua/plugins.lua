-- ----------------------------------------------------------------------
-- Loaded by: settings/nvim/init.lua
--
-- This file is used to install and configure plugins using packer.nvim
-- https://github.com/wbthomason/packer.nvim#requirements
--
-- commands:
--
-- ----------------------------------------------------------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- ----------------------------------------------------------------------
-- auto install packer.nvim if not installed
-- ----------------------------------------------------------------------
local check_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
      vim.cmd([[packadd packer.nvim]])
      return true
  end
  print('skip auto install. packer.nvim already installed...')
  return false
end
local packer_install = check_packer() -- true if packer.nvim just installed


-- ----------------------------------------------------------------------
-- import packer safely
-- ----------------------------------------------------------------------
local status, packer = pcall(require, "packer")
if not status then
  print("Cannot load packer.nvim. skip plugin installation & configuration...")
  return
end

-- ----------------------------------------------------------------------
-- install plugins
-- ----------------------------------------------------------------------
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

  -- manage a filter
  use {
    'lambdalisue/fern.vim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'TheLeoP/fern-renderer-web-devicons.nvim',
      'lambdalisue/glyph-palette.vim',
      'lambdalisue/fern-git-status.vim'
    }
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- fuzzy finder
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/vim-vsnip"

  -- scroll bar
  use 'Xuyuanp/scrollbar.nvim'

  -- execute packer sync command
  if packer_install then
    require('packer').sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])