set runtimepath^=~/.vim
let &packpath = &runtimepath

source ~/.vimrc
source ~/.config/nvim/plugin-cfg.vim
source ~/.config/nvim/whichkey.vim
"source ~/.config/nvim/.simplenoterc

autocmd VimEnter *
      \   if !argc()
      \ |   Startify
      \ |   Lexplore
      \ |   wincmd w
      \ | endif


