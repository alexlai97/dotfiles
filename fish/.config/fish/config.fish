# cat ~/.config/wpg/sequences &

set -xg PATH $HOME/.scripts $HOME/.cargo/bin $HOME/.local/bin /opt/bin /usr/local/bin /usr/bin /sbin/ /bin /usr/sbin/ /usr/bin/core_perl/ $HOME/.local/share/texlive/2019/bin/x86_64-linux/
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg MANPATH $HOME/.local/share/texlive/2019/texmf-dist/doc/man $HOME/.local/share/man /usr/local/share/man /usr/share/man 
set -xg INFOPATH $HOME/.local/share/texlive/2019/texmf-dist/doc/info
#set -xg DVTM_EDITOR $HOME/.scripts/dvtm-editor
set -xg _JAVA_AWT_WM_NONREPARENTING 1
set -xg JAVA_HOME /usr/lib/jvm/icedtea-bin-8/

set -xg EDITOR nvim
set -xg BROWSER firefox
set -xg TERMINAL termite
set -xg MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -xg WINTER_2020 "$HOME/Documents/School/Winter 2020"
set -xg DOT_FILES "$HOME/Projects/myrepos/dotfiles"
set -xg PLAYGROUND "$HOME/Projects/myrepos/Playground"

bind -M insert \cf forward-char

starship init fish | source
