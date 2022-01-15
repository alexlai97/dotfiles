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

-- PackerCompile everything this file gets written
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

-- Packages
-- references: https://github.com/rockerBOO/awesome-neovim
return require('packer').startup(function()
    --{{{ packer can manage itself
    use 'wbthomason/packer.nvim'
    --}}} 

    --{{{ nvim-compe: Auto completion plugin for nvim.
    use {
        'hrsh7th/nvim-compe',
        config = [[require('config.nvim-compe')]]
    }
    --}}}

    --{{{ which-key.nvim
    use {
        "folke/which-key.nvim",
        config = function() 
            require("which-key").setup {} 
            require("keybindings")
        end
    }
    --}}} 
    
    --{{{ nvim-treesitter
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
    --}}}

    --{{{ nvim-treesitter-textsubjects
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
    --}}}
    
    --{{{ nvim-lspconfig
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.ccls.setup{}
            require'lspconfig'.pylsp.setup{}
            require'lspconfig'.rust_analyzer.setup{}
            require'lspconfig'.gopls.setup{}
        end,
        opt = false
    }
    --}}}

    --{{{ vsnip: snippets (disabled)
    use {
        'hrsh7th/vim-vsnip',
        requires = {{'hrsh7th/vim-vsnip-integ'}, {'rafamadriz/friendly-snippets'}},
        config = [[require('config.vim-vsnip')]],
        disable = true,
    }
    ---}}}

    -- {{{ luasnip
    use {
        'L3MON4D3/LuaSnip',
        config = [[require('config.luasnip')]]
    }
    -- }}}

    --{{{ telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    --}}}

    --{{{ nvim-tree.lua: file explorer on sidebar
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}, -- for file icons
        config = function() require'nvim-tree'.setup {
            open_on_tab = true,
            disable_netrw = false,
            hijack_netrw = false,
            hijack_cursor = true,
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
        } end,
            -- vim.g.open_on_tab = 1
            -- because :e dir/ doesn't work
            -- vim.g.nvim_tree_hijack_netrw = 0
            -- vim.g.nvim_tree_disable_netrw = 0

            -- vim.g.nvim_tree_update_cwd = 1
        disable = false,
    }
    --}}}
    
    --{{{ lualine.nvim: statusline
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
    --}}}
    
    --{{{ vim-visual-multi: Multiple cursor
    -- https://github.com/mg979/vim-visual-multi
    use { 
        'mg979/vim-visual-multi', branch = 'master', disable= false,
        config = function()
            vim.g.VM_theme = 'iceblue'
            vim.g.VM_mouse_mappings = 1
        end
    }
    --}}}

    --{{{ nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }
    --}}}

    --{{{ surround.nvim 
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            -- vim.g.surround_prefix = 'S'
            vim.g.surround_mappings_style = 'surround'
            require "surround".setup {}
        end
    }
    --}}}

    --{{{ kommentary: for comments
    use 'b3nj5m1n/kommentary'
    --}}} 

    --{{{ neogit: git controls (disabled)
    use { 
        'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' ,
        config = [[require('neogit').setup{}]],
        opt = false,
        disable = true,
    }
    --}}}
    
    --{{{ vim-fugitive 
    use {
        "tpope/vim-fugitive"
    }
    --}}}

    --{{{ gitsigns.nvim
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = [[require('config.gitsigns')]],
        opt = false,
        disable = false,
    }
    --}}}

    --{{{ gruvbox colorscheme
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    --}}} 

    --{{{ colorizer (disabled)
    use { 'norcalli/nvim-colorizer.lua', config = [[require'colorizer'.setup()]], opt = true, disable = true }
    --}}} 

    -- {{{ todoist.nvim (disabled)
    -- FIXME. not working
    -- https://github.com/romgrk/todoist.nvim
    use { 'romgrk/todoist.nvim', run = ':TodoistInstall', 
        opt = true, 
        disable = true
    }
    -- }}} 

    --{{{ simplenote.vim
    -- https://github.com/simplenote-vim/simplenote.vim
    use { 'simplenote-vim/simplenote.vim',
        config = [[vim.cmd("source ~/.vim/config/plugins/nvim/simplenote-credentials.vim")]],
        disable = true,
    }
    --}}} 
    
    --{{{ nvim-luapad
    use {
        "rafcamlet/nvim-luapad",
        opt = true,
        disable = false,
    }
    --}}}

    --{{{ Tagbar
    use {
        "preservim/tagbar",
    }
    --}}}
    
    --{{{ vim-startify
    use {
        'mhinz/vim-startify',
        config = [[require('config.vim-startify')]],
        disable = true,
    }
    --}}}

end)
