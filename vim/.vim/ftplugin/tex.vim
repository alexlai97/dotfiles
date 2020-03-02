"{{{ keybinding
nmap <leader>vt :VimtexTocOpen<CR>
nmap <leader>ve :VimtexError<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
"}}}

"{{{ whichkey
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
