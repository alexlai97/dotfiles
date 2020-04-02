set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
if has('nvim')
else
    set viminfofile=$XDG_DATA_HOME/vim/viminfo
endif
