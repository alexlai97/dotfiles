" +-+-+-+-+-+-+
" |n|v|i|m|r|c|
" +-+-+-+-+-+-+

set runtimepath^=~/.vim
let &packpath = &runtimepath

source ~/.vimrc
source ~/.config/nvim/.simplenoterc.vim

"{{{- whick key setup
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}
"-}}}
