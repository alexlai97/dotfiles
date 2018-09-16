
" vim-startify
let g:startify_list_order = ['files', 'dir', 'sessions', 'bookmarks']
let g:startify_update_oldfiles = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   'Sessions']       },
      \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
      \ { 'type': 'files',     'header': [   'MRU']            },
      \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
      \ { 'type': 'commands',  'header': [   'Commands']       },
      \ ]
