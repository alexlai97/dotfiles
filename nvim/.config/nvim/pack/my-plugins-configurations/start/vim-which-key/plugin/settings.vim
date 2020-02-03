"{{{- edit vimrc / initrc
nmap <leader>rcv :edit ~/.vimrc<cr>
nmap <leader>rcn :edit $MYVIMRC<cr>
let g:which_key_map.r = {
  \ 'name' : '+rc',
  \ 'c' : 'rc',
  \ }
let g:which_key_map.r.c = {
  \ 'name' : '+rc',
  \ 'n' : 'edit init.nvim',
  \ 'v' : 'edit .vimrc',
  \ }
"-}}}

"{{{- type writer mode 
nmap <silent> <leader>dt :set so=999<CR>
nmap <silent> <leader>dT :set so=0<CR>
let g:which_key_map.d = {
  \ 'name' : '+document',
  \ 't' : 'typewritermode',
  \ 'T' : 'untoggle-typewritermode',
  \ } 
"-}}}

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

"{{{- compile / run a source
" nnoremap <leader>com :!compiler %<CR>
" autocmd Filetype c,cpp,rust nnoremap <leader>run :! ./%:r <CR>
" let g:which_key_map.c.o = {
"   \ 'm': 'compiler',
"   \ }
" let g:which_key_map.r.u = {
"   \ 'n': 'run',
"   \ }
"-}}}
