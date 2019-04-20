" vim-startify
" let g:startify_custom_header = [
      " \ '  ____  _             _   _  __       ',
      " \ ' / ___|| |_ __ _ _ __| |_(_)/ _|_   _ ',
      " \ ' \___ \| __/ _` | ''__| __| | |_| | | |',
      " \ '  ___) | || (_| | |  | |_| |  _| |_| |',
      " \ ' |____/ \__\__,_|_|   \__|_|_|  \__, |',
      " \ '                                |___/ ',
      " \ ]
" let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
" let g:startify_update_oldfiles = 1
" let g:startify_lists = [
      " \ { 'type': 'sessions',  'header': [   'Sessions']       },
      " \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
      " \ { 'type': 'files',     'header': [   'MRU']            },
      " \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
      " \ { 'type': 'commands',  'header': [   'Commands']       },
      " \ ]


" tagbar
" nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'

" Simplenote keybinding
nmap <leader>Sl :SimplenoteList<CR>
nmap <leader>Sn :SimplenoteNew<CR>
nmap <leader>Su :SimplenoteUpdate<CR>
nmap <leader>Sd :SimplenoteDelete<CR>
let g:_spacevim_mappings.S = { 'name' : '+Simplenote' }
source ~/myrepos/dotfiles/nvim/.simplenoterc


" deosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" imap <expr><TAB>
 " \ pumvisible() ? "\<C-n>" :
 " \ neosnippet#expandable_or_jumpable() ?
 " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory="~/myrepos/dotfiles/.vim/my-snips/"

" hi Conceal ctermfg=15
let g:tex_conceal=""
