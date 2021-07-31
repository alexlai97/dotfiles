--{{{ bootstrapping for packer.nvim
-- automatically ensure that packer.nvim is installed on any machine you clone your configuration to
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end
--}}} 

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- https://github.com/rockerBOO/awesome-neovim
-- {{{ config for packer
return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Auto completion plugin for nvim.
    use {
        'hrsh7th/nvim-compe',
        config = [[require('config.nvim-compe')]]
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() 
            require'nvim-treesitter.configs'.setup {
                highlight = { enable = true, },
                indent = { enable = true },
                textobjects = { enable = true },
                incremental_selection = { enable = true },
            }
        end
    }

    -- lspconfig
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.ccls.setup{}
            require'lspconfig'.pylsp.setup{}
            -- TODO
            -- rust_analyzer
        end,
        opt = false
    }

    -- lspsaga.nvim
    use {
        'glepnir/lspsaga.nvim',
        config = [[require('config.lspsaga')]],
        opt = true,
        disable = true,
    }

    -- navigator
    use {
        'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = [[require('navigator').setup()]],
        opt = true,
        disable = true
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- nvim-tree (file explorer)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}, -- for file icons
        disable = false,
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }

    -- Surround
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            vim.g.surround_prefix = 'S'
            require "surround".setup {}
        end
    }

    -- bufferline
    use {
        'akinsho/nvim-bufferline.lua', 
        requires = 'kyazdani42/nvim-web-devicons',
        disable = true,
        config = function()
            require("bufferline").setup{}
        end,
    }

    -- comment
    use 'b3nj5m1n/kommentary'

    -- neogit
    use { 
        'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' ,
        config = [[require('neogit').setup{}]],
        opt = true

    }

    -- which-key
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }

    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = [[require('config.gitsigns')]];
        opt = false
    }

    -- gruvbox
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    -- colorizer
    use { 'norcalli/nvim-colorizer.lua', config = [[require'colorizer'.setup()]], opt = true, disable = true }

    -- todoist FIXME. not working
    -- https://github.com/romgrk/todoist.nvim
    use { 'romgrk/todoist.nvim', run = ':TodoistInstall', 
        opt = true, 
        disable = true
    }

    -- plugins I might check out
    -- https://github.com/rafcamlet/nvim-luapad
    -- https://github.com/folke/lua-dev.nvim
    -- https://github.com/tjdevries/nlua.nvim
end)
-- }}}
