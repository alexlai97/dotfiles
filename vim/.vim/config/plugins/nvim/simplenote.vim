"{{{- Simplenote keybinding
nmap <leader>Sl :SimplenoteList<CR>
nmap <leader>Sn :SimplenoteNew<CR>
nmap <leader>Su :SimplenoteUpdate<CR>
nmap <leader>Sd :SimplenoteDelete<CR>
let g:which_key_map.S = {
  \ 'name' : '+Simplenote',
  \ 'l' : 'SimplenoteList',
  \ 'u' : 'SimplenoteUpdate',
  \ 'n' : 'SimplenoteNew',
  \ 'd' : 'SimplenoteDelete',
  \ }
"-}}}
