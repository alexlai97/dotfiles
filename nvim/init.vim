" +-+-+-+-+-+-+
" |n|v|i|m|r|c|
" +-+-+-+-+-+-+

set runtimepath^=~/.vim
set runtimepath+=/home/alex/.local/lilypond/usr/share/lilypond/current/vim

let &packpath = &runtimepath

source ~/.vimrc
source ~/.config/nvim/plugin-cfg.vim
source ~/.config/nvim/whichkey.vim
source ~/.config/nvim/.simplenoterc.vim
