"{{{- tagbar
let g:tagbar_ctags_bin='/usr/bin/ctags'
"-}}}

"{{{- keybinding and whichkey
" nnoremap <leader>tb :TagbarOpenAutoClose<CR>
nnoremap <F8> :TagbarToggle<CR>
" let g:which_key_map.t = {
"   \ 'name' : '+tagbar',
"   \ 'b' : 'TagbarOpenAutoClose',
"   \ }
"-}}}
