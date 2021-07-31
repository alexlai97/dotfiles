" +-+-+-+-+-+-+
" |n|v|i|m|r|c|
" +-+-+-+-+-+-+

set runtimepath^=~/.vim
" let &packpath = &runtimepath

runtime! config/setup/*.vim
runtime! config/common/*.vim
runtime! config/plugins/common/*.vim config/plugins/nvim/*.vim
