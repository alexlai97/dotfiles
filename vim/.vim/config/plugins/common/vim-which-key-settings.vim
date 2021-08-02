"{{{- edit vimrc / neovimrc / tmux.conf
nmap <leader>rcv :edit ~/.vim/config/<cr>
nmap <leader>rct :edit ~/.tmux.conf<cr>
nmap <leader>rca :edit ~/.config/alacritty/alacritty.yml<cr>
nmap <leader>rck :edit ~/.config/awesome/keybindings.lua<cr>
nmap <leader>rcf :edit ~/.config/fish/config.fish<cr>
let g:which_key_map.r = {
  \ 'name' : '+configs',
  \ 'c' : 'rc',
  \ }
let g:which_key_map.r.c = {
  \ 'name' : '+rc',
  \ 'a' : 'edit alacritty.yml',
  \ 'f' : 'edit config.fish',
  \ 't' : 'edit tmux.conf',
  \ }
"-}}}
