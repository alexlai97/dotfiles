-- enable mouse
vim.o.mouse = 'a'

-- enable number for windows
vim.wo.number = true

-- auto change dir
-- vim.o.autochdir = true

-- foldmethod
vim.wo.foldmethod = "marker"

-- time
vim.o.timeoutlen = 500
vim.o.updatetime = 100

-- color, theme
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--{{{ tabs length etc.
vim.o.tabstop = 4 -- length of one tab length
vim.o.softtabstop = 4 -- length of how ch BackSpace delete
vim.o.expandtab = true   -- Expand tabs to spaces
vim.o.shiftwidth = 4 -- << and >> moves 4 whitespaces
--}}}

-- disable F1
vim.api.nvim_set_keymap('', '<F1>', '<Nop>', { noremap = true, silent = true})

-- (local) leader keys definition
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- clipboard
vim.o.clipboard = "unnamedplus"

-- fcitx input disable
-- vim.cmd([[
-- autocmd InsertLeave * :silent !fcitx-remote -c " 退出插入模式时禁用输入法
-- autocmd BufCreate *  :silent !fcitx-remote -c " 创建 Buf 时禁用输入法
-- autocmd BufEnter *  :silent !fcitx-remote -c " 进入 Buf 时禁用输入法
-- autocmd BufLeave *  :silent !fcitx-remote -c " 离开 Buf 时禁用输入法
-- ]])
