" VIMRC

"{{- dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/alex/.cache/dein')
  call dein#begin('/home/alex/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/alex/.cache/dein/repos/github.com/Shougo/dein.vim')

  " My plugins
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('unblevable/quick-scope')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-surround')

  " nvim special (heavy tasks)
  if has('nvim')
    call dein#add('autozimu/LanguageClient-neovim')
    call dein#add('mrtazz/simplenote.vim')
    call dein#add('racer-rust/vim-racer')
    call dein#add('lervag/vimtex')
    call dein#add('majutsushi/tagbar')
    call dein#add('tpope/vim-fugitive')
  else " vim special
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

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

"-}} End dein Scripts-------------------------

" Common

set number
set relativenumber
" set cursorline
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
" if has('nvim')
"   execute pathogen#infect('light-bundle/{}','common-bundle/{}','nvim-bundle/{}','tex-bundle/{}','rust-bundle/{}')
" else
"   execute pathogen#infect('light-bundle/{}','common-bundle/{}')
" endif
" packloadall

"Helptags

" Tab
set tabstop=2 " length of one tab length
set softtabstop=2 " length of how ch BackSpace delete
set expandtab     " Expand tabs to spaces
set shiftwidth=2 " << and >> moves 4 whitespaces

" Split windows moving around
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab shortcuts
nnoremap <A-h> :bprevious<cr>
nnoremap <A-l> :bnext<cr>
nnoremap <A-j> :tabnext<cr>
nnoremap <A-k> :tabprev<cr>
nnoremap <A-b> :buffers<cr>
nnoremap <A-1> :buffer 1<cr>
nnoremap <A-2> :buffer 2<cr>
nnoremap <A-3> :buffer 3<cr>
nnoremap <A-4> :buffer 4<cr>
nnoremap <A-5> :buffer 5<cr>
nnoremap <A-6> :buffer 6<cr>
nnoremap <A-7> :buffer 7<cr>
nnoremap <A-8> :buffer 8<cr>
nnoremap <A-9> :buffer 9<cr>

" set termguicolors
" set background=dark
" colorscheme wal

" leader
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" multi cursor
let g:multi_cursor_exit_from_insert_mode=0

" netrw
let g:netrw_winsize=20

nnoremap <F3> :Lexplore<CR>
