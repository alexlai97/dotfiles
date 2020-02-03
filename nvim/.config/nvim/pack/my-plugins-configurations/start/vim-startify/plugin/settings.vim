"{{{- vim-startify
let g:startify_custom_header = [
      \ '          ____  _             _   _  __       ',
      \ '         / ___|| |_ __ _ _ __| |_(_)/ _|_   _ ',
      \ '         \___ \| __/ _` | ''__| __| | |_| | | |',
      \ '          ___) | || (_| | |  | |_| |  _| |_| |',
      \ '         |____/ \__\__,_|_|   \__|_|_|  \__, |',
      \ '                                        |___/ ',
      \ ]
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_update_oldfiles = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   'Sessions']       },
      \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
      \ { 'type': 'files',     'header': [   'MRU']            },
      \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
      \ { 'type': 'commands',  'header': [   'Commands']       },
      \ ]
"-}}}

"{{{- keybinding and whichkey
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
