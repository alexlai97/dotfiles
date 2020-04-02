"{{{- Color Colorscheme  
if exists("g:gnvim") 
  colorscheme desert
  autocmd VimResized * call gnvim#set_gui_colors()
  " set guicursor+=a:blinkon333
  " let g:qs_enable=0
elseif has('nvim')
    colorscheme wpgtkAlt
endif
" set termguicolors
" set background=dark
"-}}}
