
"{{{- quickfix key 
nnoremap [q :cprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>
"}}}

"{{{- window/buffer/tab key shortcut
" Split windows moving around
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k

" Buffers/Tab shortcuts
" nnoremap <A-h> :bprevious<cr>
" nnoremap <A-l> :bnext<cr>
" nnoremap <A-j> :tabnext<cr>
" nnoremap <A-k> :tabprev<cr>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" nnoremap [t :tprev<cr>
" nnoremap ]t :tnext<cr>
" nnoremap <A-b> :buffers<cr>
" nnoremap <A-1> :buffer 1<cr>
" nnoremap <A-2> :buffer 2<cr>
" nnoremap <A-3> :buffer 3<cr>
" nnoremap <A-4> :buffer 4<cr>
" nnoremap <A-5> :buffer 5<cr>
" nnoremap <A-6> :buffer 6<cr>
" nnoremap <A-7> :buffer 7<cr>
" nnoremap <A-8> :buffer 8<cr>
" nnoremap <A-9> :buffer 9<cr>
"-}}}

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
