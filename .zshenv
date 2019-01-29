#export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin:$HOME/.node_modules/bin
export PATH="$HOME/bin:$HOME/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.texlive/2018/bin/x86_64-linux:${PATH}"
export MANPATH=$HOME/.texlive/2018/texmf-dist/doc/man:$MANPATH
export INFOPATH=$HOME/.texlive/2018/texmf-dist/doc/info:$INFOPATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#export EDITOR=/usr/bin/nvim
export TERMCMD=$HOME/bin/st

export _JAVA_AWT_WM_NONREPARENTING=1

# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"
