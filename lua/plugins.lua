local fn = vim.fn
local install_path = DATA_PATH..'/site/pack/packer/start/packer.nvim'

-- install packer if it's not installed already
local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer').startup(function(use)
  -- Packer should manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'EdenEast/nightfox.nvim'

  -- git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
        'nvim-lua/plenary.nvim'
    }
  }

  -- surround vim
  use 'tpope/vim-surround'

  -- status line
  use 'glepnir/galaxyline.nvim'

  -- show recent files on empty nvim command
  use 'mhinz/vim-startify'

  -- lsp config
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- for LSP autocompletion
  -- neovim lsp client
  use 'hrsh7th/cmp-nvim-lsp'
  -- word autocomplete
  use 'hrsh7th/cmp-buffer'
  -- path autocomplete
  use 'hrsh7th/cmp-path'
  -- command autocomplete
  use 'hrsh7th/cmp-cmdline'
  -- better compeletion engine
  use 'hrsh7th/nvim-cmp'

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- telescope - searching / navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- better highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- directory tree tab
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- prettier tabs
  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- show indentation levels
  use 'lukas-reineke/indent-blankline.nvim'

  -- highlight variables under cursor
  use 'RRethy/vim-illuminate'

  -- auto-bracket
  use 'jiangmiao/auto-pairs'

  -- add configuration reload to vim
  use 'famiu/nvim-reload'

  -- only the first time NeoVim is opened, because that's when Packer gets installed
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- plugin specific configs go here
require('plugin-config/nightfox')
require('plugin-config/gitsigns')
require('plugin-config/galaxyline')
require('plugin-config/telescope')
require('plugin-config/bufferline')
require('plugin-config/nvim-cmp')
require('plugin-config/nvim-treesitter')
require('plugin-config/nvim-tree')

return packer
