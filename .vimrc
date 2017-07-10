set nocompatible 
filetype off    

:let mapleader=','
"colorscheme solarized

" Common Settings
syntax on
set showcmd
set ruler
set smartindent 
set incsearch
set hlsearch
set mouse=a
"set number
set hidden

" Tab
set tabstop=2 " length of one tab length
set softtabstop=2 " length of how ch BackSpace delete
set shiftwidth=2 " << and >> moves 4 whitespaces
set smarttab
set noexpandtab
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""
"""{{{ Plugins in Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'auto_mkdir'
Plugin 'godlygeek/tabular'
"Plugin 'tpope/vim-fugitive'
"Plugin 'kien/ctrlp.vim'

call vundle#end()        
filetype plugin indent on
"""}}}
""""""""""""""""""""""""""""""""""""""""""""""""""



"""{{{ Vimwiki 
let g:vimwiki_list = [
			\{'path': '~/Documents/VimWiki/personal.wiki'}
		\]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d : VimWikiMakeDiaryNote
"""}}}




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



"""{{{ NERDtree Settings
" NERDtree 文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <Leader>tt :NERDTree<CR>
"""}}}



""" Move Mapping
" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab操作快捷方式!
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk


""" Leader Mapping
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
nmap <leader>rc :edit $MYVIMRC <cr>
