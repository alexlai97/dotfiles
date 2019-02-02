#export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin:$HOME/.node_modules/bin
export PATH="$HOME/bin:$HOME/.scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.texlive/2018/bin/x86_64-linux:${PATH}"
export MANPATH=$HOME/.texlive/2018/texmf-dist/doc/man:$HOME/share/man:$MANPATH
export INFOPATH=$HOME/.texlive/2018/texmf-dist/doc/info:$INFOPATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#export EDITOR=/usr/bin/nvim
export TERMCMD=$HOME/bin/st
export DVTM_EDITOR=$HOME/.scripts/dvtm-editor

export _JAVA_AWT_WM_NONREPARENTING=1

# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#function addToPATH {
#  case ":$PATH:" in
#    *":$1:"*) :;; # already there
#    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
#  esac
#}
#
#addToPATH ~/bin
#addToPATH ~/.bin
#addToPATH ~/.cargo/bin
#addToPATH ~/.local/bin
#addToPATH ~/.texlive/2018/bin/x86_64-linux

typeset -U PATH
typeset -U MANPATH
typeset -U INFOPATH
