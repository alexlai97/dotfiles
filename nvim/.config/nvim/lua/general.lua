vim.o.mouse = 'a'
vim.wo.number = true
-- vim.o.autochdir = true
vim.wo.foldmethod = "marker"

vim.o.timeoutlen = 500
vim.o.updatetime = 100

-- color
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--{{{ tabs
vim.o.tabstop=4 -- length of one tab length
vim.o.softtabstop=4 -- length of how ch BackSpace delete
vim.o.expandtab = true   -- Expand tabs to spaces
vim.o.shiftwidth=4 -- << and >> moves 4 whitespaces
--}}}

-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.clipboard = "unnamedplus"

