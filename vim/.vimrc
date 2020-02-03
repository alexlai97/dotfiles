"   _   _   _   _   _   _  
"  / \ / \ / \ / \ / \ / \ 
" ( . | v | i | m | r | c )
"  \_/ \_/ \_/ \_/ \_/ \_/ 
" 

"{{{- dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " nvim special (heavy tasks)
  if has('nvim')
    call dein#add('simplenote-vim/simplenote.vim')
    call dein#add('lervag/vimtex')
    call dein#add('majutsushi/tagbar')
    call dein#add('tpope/vim-fugitive')
    call dein#add('mhinz/vim-signify')
    call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
    call dein#add('honza/vim-snippets')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('Shougo/denite.nvim')
  else " vim special
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Common plugins for vim and nvim
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-surround')
  call dein#add('junegunn/vim-easy-align')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"-}}} End dein Scripts-------------------------

"{{{- Common settings
set number
set relativenumber
" set cursorline
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
set updatetime=100
"-}}}

"{{{- Color Colorscheme  
if exists("g:gnvim") 
  colorscheme desert
  " let g:qs_enable=0
endif
" set termguicolors
" set background=dark
" colorscheme wal
"-}}}

"{{{- Tab
set tabstop=2 " length of one tab length
set softtabstop=2 " length of how ch BackSpace delete
set expandtab     " Expand tabs to spaces
set shiftwidth=2 " << and >> moves 4 whitespaces
"-}}}

"{{{- leader
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
"-}}}

"{{{- netrw
let g:netrw_winsize=20
let g:netrw_liststyle = 3
let g:netrw_banner = 0
nnoremap <F3> :Lexplore %:p:h<CR>
"-}}}

"{{{- foldmethod
" autocmd Filetype vim,sh set foldmethod=marker
set foldmethod=marker
"-}}}

"{{{- window/buffer/tab key shortcut
" Split windows moving around
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k

" Buffers/Tab shortcuts
nnoremap <A-h> :bprevious<cr>
nnoremap <A-l> :bnext<cr>
nnoremap <A-j> :tabnext<cr>
nnoremap <A-k> :tabprev<cr>
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