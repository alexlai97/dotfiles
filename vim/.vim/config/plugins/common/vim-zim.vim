let g:zim_wiki_lang="en"
" let g:zim_notebooks_dir="~/Nextcloud/Notebooks"

"{{{- Zim keybinding
nmap <leader>Zl :ZimList<CR>
nmap <leader>Zn :ZimNewNote<space>
nmap <leader>Zcd :ZimCD<space>
let g:which_key_map.Z = {
  \ 'name' : '+Zim',
  \ 'l' : 'ZimList',
  \ 'n' : 'ZimNewNote',
  \ 'c' : 'ZimCD',
  \ }

let g:which_key_map.Z.c = {
  \ 'name' : '+ZimC',
  \ 'd' : 'ZimCD',
  \ }
"-}}}
