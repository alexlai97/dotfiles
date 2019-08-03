(cat $HOME/.cache/wpgtk.sequences & )
#clear
#

export ZSH=$HOME/.oh-my-zsh
#source $HOME/.zshenv
#export RUST_SRC_PATH=/home/alexlai/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src
#export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$PATH

fpath+=~/.zfunc

#ZSH_TMUX_AUTOSTART=true
ZSH_THEME="arrow"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=120
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git z tmux vi-mode cargo rust
)

source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/z/z.sh
# source $ZSH/plugins/git/git.plugin.zsh#


# User configuration
# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# vim-mode keybinding in terminal
# bindkey -v

# Functions
function cs() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls
}


bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# added by travis gem
[ -f /home/alex/.travis/travis.sh ] && source /home/alex/.travis/travis.sh
