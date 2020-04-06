"{{{- edit vimrc / neovimrc / tmux.conf
nmap <leader>rcv :edit ~/.vim/vimrc<cr>
nmap <leader>rcn :edit ~/.config/nvim/init.vim<cr>
nmap <leader>rct :edit ~/.tmux.conf<cr>
nmap <leader>rca :edit ~/.config/alacritty/alacritty.yml<cr>
nmap <leader>rcf :edit ~/.config/fish/config.fish<cr>
nmap <leader>rck :edit ~/.config/awesome/keybindings.lua<cr>
nmap <leader>rcm :edit ~/.config/mutt/muttrc<cr>
let g:which_key_map.r = {
  \ 'name' : '+configs',
  \ 'c' : 'rc',
  \ }
let g:which_key_map.r.c = {
  \ 'name' : '+rc',
  \ 'a' : 'edit alacritty.yml',
  \ 'n' : 'edit init.nvim',
  \ 'v' : 'edit .vimrc',
  \ 'f' : 'edit config.fish',
  \ 'k' : 'edit keybinding.lua',
  \ 't' : 'edit tmux.conf',
  \ 'm' : 'edit muttrc',
  \ }
"-}}}
