-- https://github.com/glepnir/lspsaga.nvim
require('lspsaga').init_lsp_saga{
}

vim.cmd([[nnoremap <silent>K :Lspsaga hover_doc<CR>]])
