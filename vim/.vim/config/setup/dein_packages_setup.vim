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

  else " vim special
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Common plugins for vim and nvim
  call dein#add('simplenote-vim/simplenote.vim')
  call dein#add('lervag/vimtex')
  call dein#add('majutsushi/tagbar')
  call dein#add('tpope/vim-fugitive')
  call dein#add('mhinz/vim-signify')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
  call dein#add('honza/vim-snippets')
  call dein#add('easymotion/vim-easymotion')
  " call dein#add('itchyny/lightline.vim')
  call dein#add('deviantfero/wpgtk.vim')
  call dein#add('Yggdroot/indentLine')

  call dein#add('jiangmiao/auto-pairs')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-surround')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('dag/vim-fish')
  call dein#add('cespare/vim-toml')
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
              \ 'build': 'sh -c "cd app & yarn install"' })
  call dein#add('luffah/vim-zim') 
  call dein#add('ap/vim-css-color') 

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
