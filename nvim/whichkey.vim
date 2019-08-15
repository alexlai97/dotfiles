"  _       ____    _      __       __ __          
" | |     / / /_  (_)____/ /_     / //_/__  __  __
" | | /| / / __ \/ / ___/ __ \   / ,< / _ \/ / / /
" | |/ |/ / / / / / /__/ / / /  / /| /  __/ /_/ / 
" |__/|__/_/ /_/_/\___/_/ /_/  /_/ |_\___/\__, /  
"                                        /____/   
"  

"{{{- whick key setup
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}
"-}}}

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

"{{{- startify keybinding
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
"-}}}

"{{{- vimtex keybinding
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


"{{{- Rust, racer, cargo
au FileType rust nmap <leader>gs <Plug>(rust-def-split)
au FileType rust nmap <leader>gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-def)
au FileType rust nmap <leader>gD <Plug>(rust-doc)
au FileType rust nnoremap<leader>cb :!cargo build <CR>
au FileType rust nnoremap<leader>cr :!cargo run <CR>
au FileType rust nnoremap<leader>ct :!cargo test <CR>
au FileType rust nnoremap<leader>cc :!cargo check <CR>
au FileType rust nnoremap<leader>cp :!cargo-clippy <CR>
let g:which_key_map.g = {
  \ 'name' : '+goto',
  \ 'd' : 'rust-def',
  \ 'D' : 'rust-doc',
  \ 's' : 'rust-def-split',
  \ 'x' : 'rust-def-vertical',
  \ }
let g:which_key_map.c = {
  \ 'name' : '+cargo|compiler',
  \ 'b' : 'cargo build',
  \ 'r' : 'cargo run',
  \ 't' : 'cargo test',
  \ 'p' : 'cargo clippy',
  \ }
"-}}}

"{{{- compile / run a source
nnoremap <leader>com :!compiler %<CR>
autocmd Filetype c,cpp,rust nnoremap <leader>run :! ./%:r <CR>
let g:which_key_map.c.o = {
  \ 'm': 'compiler',
  \ }
" let g:which_key_map.r.u = {
"   \ 'n': 'run',
"   \ }
"-}}}


"{{{- tagbar
nnoremap <leader>tb :TagbarOpenAutoClose<CR>
nnoremap <F8> :TagbarToggle<CR>
let g:which_key_map.t = {
  \ 'name' : '+tagbar',
  \ 'b' : 'TagbarOpenAutoClose',
  \ }
"-}}}


"{{{- urlview
" nnoremap <leader>url :!st -e urlview %<CR>
nnoremap <leader>url :term urlview % <CR> i
let g:which_key_map.u = {
  \ 'name' : '+urlview',
  \ 'r' : 'urlview',
  \ }
let g:which_key_map.u.r = {
  \ 'name' : '+urlview',
  \ 'l' : 'urlview',
  \ }
"-}}}

