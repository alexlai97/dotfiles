#{{{ run functions

#{{{ load wpg sequences 
# load_wpg_sequences
#}}}

#{{{ fzf key bindings
fzf_key_bindings
#}}}

#}}}

#{{{ set variables

# proxy
# set -xg ALL_PROXY "127.0.0.1:7890"  # 同时设置http、https以及ftp代理
set -xg http_proxy "http://127.0.0.1:7890"
set -xg https_proxy $http_proxy
set -xg HTTP_PROXY $http_proxy
set -xg HTTPS_PROXY $http_proxy
set -xg ftp_proxy $http_proxy

# xdg 
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_DATA_HOME $HOME/.local/share
# set -xg XDG_DATA_DIRS /var/lib/snapd/desktop/
set -xg XDG_CACHE_HOME $HOME/.cache

# path
set -xg GOPATH "$HOME/go"
set -xg NODE_PATH "$XDG_DATA_HOME/npm/lib/node_modules"
set -xg PATH $HOME/.scripts $XDG_DATA_HOME/npm/bin $GOPATH/bin $CARGO_HOME/bin $HOME/.luarocks/bin $HOME/.emacs.d/bin $HOME/.config/vifm/scripts $HOME/.local/share/texlive/2020/bin/x86_64-linux/ /usr/bin/core_perl/ $HOME/.local/bin /opt/bin /usr/local/bin /usr/bin /sbin/ /bin /usr/sbin/ 
# set -xg MANPATH $HOME/.local/share/texlive/2019/texmf-dist/doc/man $HOME/.local/share/man /usr/local/share/man /usr/share/man 
# set -xg INFOPATH $HOME/.local/share/texlive/2019/texmf-dist/doc/info

# xdg config
set -xg GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -xg WEECHAT_HOME $XDG_CONFIG_HOME/weechat
set -xg NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -xg NOTMUCH_CONFIG $XDG_CONFIG_HOME/notmuch/config

# xdg data
set -xg TERMINFO $XDG_DATA_HOME/terminfo
set -xg TERMINFO_DIRS $XDG_DATA_HOME/terminfo /usr/share/terminfo
set -xg CARGO_HOME $XDG_DATA_HOME/cargo
set -xg PASSWORD_STORE_DIR $XDG_DATA_HOME/password-store
set -xg MYSQL_HISTFILE $XDG_DATA_HOME/mysql_history
set -xg SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -xg GRADLE_USER_HOME $XDG_DATA_HOME/gradle

# other
set -xg LESSHISTFILE -
set -xg _JAVA_AWT_WM_NONREPARENTING 1
set -xg JAVA_HOME /usr/lib/jvm/icedtea-bin-8/
#set -xg DVTM_EDITOR $HOME/.scripts/dvtm-editor
set -xg DOTREMINDERS $XDG_CONFIG_HOME/remind # remind
set -xg CM_HISTLENGTH 20 # clipmenu
set -xg CM_LAUNCHER rofi # clipmenu

# common
set -xg EDITOR nvim
set -xg GUIEDITOR neovide
set -xg BROWSER firefox
set -xg TERMINAL alacritty
set -xg MANPAGER "sh -c 'col -bx | bat -l man -p'"

# directories
set -xg KBFS "$XDG_RUNTIME_DIR/keybase/kbfs/"
set -xg WINTER_2020 "$HOME/Documents/School/Winter 2020"
set -xg DOT_FILES "$HOME/Projects/myrepos/dotfiles"
set -xg PLAYGROUND "$HOME/Projects/Playground"

# personal
set -xg KEYID_PRIMARY "F0AAEA19" 
set -xg EMAIL "alexlai97@outlook.com"

# todoist
# set -xg TODOIST_API_KEY (pass tools/todoist-api)
#}}}

#{{{ bindings
bind -M insert \cf forward-char
#}}}

#{{{ enable conda
source /opt/miniconda3/etc/fish/conf.d/conda.fish
#}}}

#{{{ start using starship
starship init fish | source
#}}}

# vim: ft=fish
