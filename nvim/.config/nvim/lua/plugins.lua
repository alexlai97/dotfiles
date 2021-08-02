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
        config = function()
            vim.g.nvim_tree_tab_open = 1
            -- because :e dir/ doesn't work
            vim.g.nvim_tree_hijack_netrw = 0
            vim.g.nvim_tree_disable_netrw = 0

            vim.g.nvim_tree_update_cwd = 1
        end,
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
            -- vim.g.surround_prefix = 'S'
            vim.g.surround_mappings_style = 'surround'
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
        opt = false
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

    -- simplenote.vim
    -- https://github.com/simplenote-vim/simplenote.vim
    use { 'simplenote-vim/simplenote.vim', config = [[vim.cmd("source ~/.vim/config/plugins/nvim/simplenote-credentials.vim")]]}

    -- Multiple cursor
    -- https://github.com/mg979/vim-visual-multi
    use { 
        'mg979/vim-visual-multi', branch = 'master', disable= false,
        config = function()
            vim.g.VM_theme = 'iceblue'
            vim.g.VM_mouse_mappings = 1
        end
    }

    -- statusline
    -- https://github.com/hoob3rt/lualine.nvim
    use {
        'hoob3rt/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons', opt = false,
        config = function()
            require('lualine').setup{
                options = {
                    icons_enabled = true,
                    theme = 'gruvbox',
                    disabled_filetypes = {"NvimTree"}
                },
            }
        end 
    }

    -- nvim-tree-textsubjects
    -- https://github.com/RRethy/nvim-treesitter-textsubjects
    use {
        'RRethy/nvim-treesitter-textsubjects',
        config = function()
            require'nvim-treesitter.configs'.setup {
                textsubjects = {
                    enable = true,
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                        [';'] = 'textsubjects-container-outer',
                    }
                },
            }
        end
    }

    -- plugins I might check out
    -- https://github.com/rafcamlet/nvim-luapad
    -- https://github.com/folke/lua-dev.nvim
    -- https://github.com/tjdevries/nlua.nvim
end)
-- }}}
