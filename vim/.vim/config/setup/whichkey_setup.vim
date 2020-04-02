"{{{- leader
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
"-}}}

"{{{- whick key mappings
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>
nnoremap <silent> ,             :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '\'<CR>
vnoremap <silent> ,             :<c-u>WhichKeyVisual ','<CR>
"}}}

"{{{ setup
" set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}
"-}}}
