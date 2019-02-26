set -xg PATH /home/alex/.stack/programs/x86_64-linux/ghc-tinfo6-8.4.3/bin/ /bin /usr/bin /sbin/ /home/alex/bin /home/alex/.scripts /home/alex/.cargo/bin /home/alex/.local/bin /home/alex/.texlive/2018/bin/x86_64-linux/ /opt/bin /usr/local/bin

set -xg XDG_CONFIG_HOME /home/alex/.config
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg MANPATH $HOME/.texlive/2018/texmf-dist/doc/man $HOME/share/man  /usr/local/share/man /usr/share/man /usr/share/gcc-data/x86_64-pc-linux-gnu/7.3.0/man
set -xg INFOPATH $HOME/.texlive/2018/texmf-dist/doc/info 
#set -xg DVTM_EDITOR /home/alex/.scripts/dvtm-editor
set -xg _JAVA_AWT_WM_NONREPARENTING 1

set -g EDITOR vi

#source ~/.aliases
# source ~/.config/fish/abbr.fish

# if test "$TERM" = "st-256color"
#    loadcolor
# end 
#fzf_key_bindings
