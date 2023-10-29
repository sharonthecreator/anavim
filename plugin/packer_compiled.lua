-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sharon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sharon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sharon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sharon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sharon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "git@gitlab.org:neovim/plugins/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "git@gitlab.org:neovim/plugins/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@gitlab.org:neovim/plugins/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "git@gitlab.org:neovim/plugins/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@gitlab.org:neovim/plugins/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@gitlab.org:neovim/plugins/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "git@gitlab.org:neovim/plugins/cmp-vsnip"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "git@gitlab.org:neovim/plugins/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "git@gitlab.org:neovim/plugins/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "git@gitlab.org:neovim/plugins/goto-preview"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "git@gitlab.org:neovim/plugins/guess-indent.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@gitlab.org:neovim/plugins/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "git@gitlab.org:neovim/plugins/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "git@gitlab.org:neovim/plugins/lspsaga.nvim"
  },
  ["nice-reference.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nice-reference.nvim",
    url = "git@gitlab.org:neovim/plugins/nice-reference.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "git@gitlab.org:neovim/plugins/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "git@gitlab.org:neovim/plugins/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@gitlab.org:neovim/plugins/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "git@gitlab.org:neovim/plugins/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@gitlab.org:neovim/plugins/nvim-lspconfig"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-reload",
    url = "git@gitlab.org:neovim/plugins/nvim-reload"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@gitlab.org:neovim/plugins/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@gitlab.org:neovim/plugins/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@gitlab.org:neovim/plugins/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@gitlab.org:neovim/plugins/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@gitlab.org:neovim/plugins/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@gitlab.org:neovim/plugins/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "git@gitlab.org:neovim/plugins/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "git@gitlab.org:neovim/plugins/trouble.nvim"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "git@gitlab.org:neovim/plugins/vim-illuminate"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/sharon/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "git@gitlab.org:neovim/plugins/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
