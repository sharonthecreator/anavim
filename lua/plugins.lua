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
  -- packer should manage itself
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

  -- status line
  use 'glepnir/galaxyline.nvim'

  -- starting menu
  use 'goolord/alpha-nvim'

  -- lsp config
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- for LSP autocompletion
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'
  -- later -> use {'ms-jpq/coq.thirdparty', branch ='3p' }

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
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- prettier tabs
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- nice diagnostic window on the bottom
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- support the missing lsp diagnostic colors
  use 'folke/lsp-colors.nvim'

  -- better LSP UI (for code actions, rename etc.)
  use 'kkharji/lspsaga.nvim'

  -- better reference UI
  use {
    'wiliamks/nice-reference.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      { 'rmagatti/goto-preview', config = function() require('goto-preview').setup {} end }
    }
  }

  use 'lervag/vimtex'

  -- show indentation levels
  use 'lukas-reineke/indent-blankline.nvim'

  -- guess file indentation
  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end,
  }

  use "akinsho/toggleterm.nvim"

  use 'wfxr/minimap.vim'

  -- highlight variables under cursor
  use 'RRethy/vim-illuminate'

  -- auto-bracket
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end,
  }

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
require('plugin-config/alpha-nvim')
require('plugin-config/bufferline')
require('plugin-config/coq')
require('plugin-config/mason')
require('plugin-config/nvim-treesitter')
require('plugin-config/nvim-tree')
require('plugin-config/trouble')
require('plugin-config/lsp-colors')
require('plugin-config/lspsaga')
require('plugin-config/nice-reference')
require('plugin-config/toggleterm')
require('plugin-config/minimap')
require('plugin-config/vimtex')

return packer
