"{{{ Denite
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-v>
       \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Esc> 
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })
"}}} 

"{{{ keybinding and whichkey
nmap <leader>ls :Denite buffer<CR>
nmap <leader>/  :DeniteBufferDir grep<CR>
nmap <leader>?  :Denite grep<CR>
nmap <leader>f  :DeniteBufferDir file/rec<CR>
"}}}
