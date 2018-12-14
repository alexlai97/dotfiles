" Which key
"
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}


nmap <leader>rcv :edit ~/.vimrc<cr>
nmap <leader>rcn :edit $MYVIMRC<cr>
let g:which_key_map.r = {
  \ 'name' : '+r',
  \ 'c' : 'rc',
  \ }
let g:which_key_map.r.c = {
  \ 'name' : '+rc',
  \ 'n' : 'edit init.nvim',
  \ 'v' : 'edit .vimrc',
  \ }


" type writer mode
nmap <silent> <leader>dt :set so=999<CR>
nmap <silent> <leader>dT :set so=0<CR>
let g:which_key_map.d = {
  \ 'name' : '+document',
  \ 't' : 'typewritermode',
  \ 'T' : 'untoggle-typewritermode',
  \ } 

" startify keybinding
nmap <leader>st :Startify<CR>
nmap <Leader>ss :SSave<CR>
nmap <Leader>sd :SDelete<CR>
nmap <Leader>sc :SClose<CR>
let g:which_key_map.s = {
  \ 'name' : '+startify',
  \ 't' : 'Startify',
  \ 's' : 'SSave',
  \ 'd' : 'SDelete',
  \ 'c' : 'SClose',
  \ }

" tex keybinding
nmap <leader>vt :VimtexTocOpen<CR>
nmap <leader>ve :VimtexError<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
let g:which_key_map.v = {
  \ 'name' : '+vimtex',
  \ 'v' : 'VimtexView',
  \ 'e' : 'VimtexError',
  \ 't' : 'VimtexTocOpen',
  \ 's' : 'VimtexStatus',
  \ 'n' : 'VimtexClean',
  \ }
let g:which_key_map.v.c = {
  \ 'name' : '+compile',
  \ 'o' : 'VimtexCompileOutput',
  \ 'c' : 'VimtexCompile',
  \ }

" Simplenote keybinding
nmap <leader>Sl :SimplenoteList<CR>
nmap <leader>Sn :SimplenoteNew<CR>
nmap <leader>Sd :SimplenoteDelete<CR>
let g:which_key_map.S = {
  \ 'name' : '+Simplenote',
  \ 'l' : 'SimplenoteList',
  \ 'n' : 'SimplenoteNew',
  \ 'd' : 'SimplenoteDelete',
  \ }


" Rust , racer, cargo
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
au FileType rust nnoremap<leader>cb :!cargo build <CR>
au FileType rust nnoremap<leader>cr :!cargo run <CR>
au FileType rust nnoremap<leader>ct :!cargo test <CR>
let g:which_key_map.g = {
  \ 'name' : '+goto',
  \ 'd' : 'rust-doc',
  \ }
let g:which_key_map.c = {
  \ 'name' : '+cargo',
  \ 'b' : 'cargo build',
  \ 'r' : 'cargo run',
  \ 't' : 'cargo test',
  \ }


" c type file key commands
autocmd Filetype c,cpp nnoremap <leader>m :!g++ -std=c++14 -Wall -Werror -g % -o %:r<CR>
autocmd Filetype c,cpp nnoremap <leader>r :!./%:r <CR>

