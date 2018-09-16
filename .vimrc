" VIMRC

set number
set relativenumber
set cursorline
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
execute pathogen#infect()
syntax on
filetype plugin indent on

" Tab
set tabstop=2 " length of one tab length
set softtabstop=2 " length of how ch BackSpace delete
set shiftwidth=2 " << and >> moves 4 whitespaces

" Split windows moving around
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab shortcuts
map <A-h> :bprevious<cr>
map <A-l> :bnext<cr>
map <A-j> :tabnext<cr>
map <A-k> :tabprev<cr>
map <A-b> :buffers<cr>
map <A-1> :buffer 1<cr>
map <A-2> :buffer 2<cr>
map <A-3> :buffer 3<cr>
map <A-4> :buffer 4<cr>
map <A-5> :buffer 5<cr>
map <A-6> :buffer 6<cr>
map <A-7> :buffer 7<cr>
map <A-8> :buffer 8<cr>
map <A-9> :buffer 9<cr>


" set termguicolors
set background=dark
"colorscheme gruvbox

let mapleader = '\'
"let maplocalleader = "\\"
nmap <leader>rc :edit $MYVIMRC<cr>


let g:multi_cursor_exit_from_insert_mode=0

" vimtex
let g:vimtex_view_method='zathura'

" c type file key commands
autocmd Filetype c,cpp nnoremap <leader>m :!g++ -std=c++14 -Wall -Werror -g % -o %:r<CR>
autocmd Filetype c,cpp nnoremap <leader>r :!./%:r <CR>


