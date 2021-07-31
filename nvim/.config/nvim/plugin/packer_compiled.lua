-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alex/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/alex/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/alex/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/alex/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alex/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/alex/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neogit = {
    config = { "require('neogit').setup{}" },
    loaded = false,
    needs_bufread = false,
    path = "/home/alex/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2h\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\n<s-s>\20surround_prefix\6g\bvim\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'colorizer'.setup()" },
    loaded = false,
    needs_bufread = false,
    path = "/home/alex/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "require('config.nvim-compe')" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2f\0\0\2\0\5\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0002\1\0\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\4\0007\0\3\0002\1\0\0>\0\2\1G\0\1\0\npylsp\nsetup\tccls\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2Ë\1\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\26incremental_selection\1\0\1\venable\2\16textobjects\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2b\0\0\2\0\a\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0002\1\0\0>\0\2\1G\0\1\0\nsetup\rsurround\frequire\6S\20surround_prefix\6g\bvim\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2b\0\0\2\0\a\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0002\1\0\0>\0\2\1G\0\1\0\nsetup\rsurround\frequire\6S\20surround_prefix\6g\bvim\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2f\0\0\2\0\5\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0002\1\0\0>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\4\0007\0\3\0002\1\0\0>\0\2\1G\0\1\0\npylsp\nsetup\tccls\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2Ë\1\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\26incremental_selection\1\0\1\venable\2\16textobjects\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2h\0\0\2\0\a\0\n4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\n<s-s>\20surround_prefix\6g\bvim\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require('config.nvim-compe')
time([[Config for nvim-compe]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
