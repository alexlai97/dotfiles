" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug '~/.local/share/nvim/plugged/calendar-vim'
Plug 'DataWraith/auto_mkdir'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

Plug 'vimwiki/vimwiki'
call plug#end()


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
colorscheme gruvbox

let mapleader = '\'
"let maplocalleader = "\\"
nmap <leader>rc :edit $MYVIMRC<cr>



"""{{{ Airline Settings
" Theme
let g:airline_theme='base16_ocean'
" Symbols
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
"""}}}



"""{{{ Vimwiki 
let g:vimwiki_list = [
			\{'path': '~/Documents/VimWiki/personal.wiki'}
		\]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d : VimWikiMakeDiaryNote
let g:vimwiki_use_calendar=1
"""}}}
