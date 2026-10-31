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
local plugins_missing = fn.empty(fn.glob(DATA_PATH..'/site/pack/packer/start/nightfox.nvim')) > 0

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

  -- completion engine + sources
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- snippet engine (required by nvim-cmp)
  use {'L3MON4D3/LuaSnip', run = 'make install_jsregexp'}
  use 'saadparwaiz1/cmp_luasnip'

  -- Claude AI completions (ghost text + cmp source)
  use {'milanglacier/minuet-ai.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Debugger, and UI
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'theHamsta/nvim-dap-virtual-text'

  -- telescope - searching / navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  use {
    'folke/noice.nvim',
    requires = {'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify'}
  }

  -- better highlighting
  use {'nvim-treesitter/nvim-treesitter', branch = 'master'}

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

  -- Minimap, not sure about it yet.
  -- use 'gorbit99/codewindow.nvim'

  -- highlight variables under cursor
  use 'RRethy/vim-illuminate'

  -- auto-bracket
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end,
  }

  -- add configuration reload to vim
  use 'famiu/nvim-reload'

  if packer_bootstrap or plugins_missing then
    require('packer').sync()
  end
end)

-- plugin specific configs go here
if packer_bootstrap or plugins_missing then
  return packer
end

local function configure(module)
  local ok, err = pcall(require, module)
  if not ok then
    vim.schedule(function()
      vim.notify('Anavim: ' .. module .. ': ' .. tostring(err), vim.log.levels.WARN)
    end)
  end
end

configure('plugin-config/nightfox')
configure('plugin-config/gitsigns')
configure('plugin-config/galaxyline')
configure('plugin-config/telescope')
configure('plugin-config/noice')
configure('plugin-config/nvim-dap')
configure('plugin-config/alpha-nvim')
configure('plugin-config/bufferline')
configure('plugin-config/nvim-cmp')
-- require('plugin-config/minuet-ai')
configure('plugin-config/mason')
configure('plugin-config/nvim-treesitter')
configure('plugin-config/nvim-tree')
configure('plugin-config/trouble')
configure('plugin-config/lsp-colors')
configure('plugin-config/lspsaga')
configure('plugin-config/nice-reference')
configure('plugin-config/toggleterm')
configure('plugin-config/vimtex')
-- require('plugin-config/codewindow')

return packer
