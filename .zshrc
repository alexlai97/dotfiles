export PATH=$HOME/.local/bin:$HOME/.texlive/2018/bin/x86_64-linux:$PATH
# :$HOME/sys161/bin:$HOME/sys161/tools/bin:
export MANPATH=$HOME/.texlive/2018/texmf-dist/doc/man:$MANPATH
export INFOPATH=$HOME/.texlive/2018/texmf-dist/doc/info:$INFOPATH
export ZSH=/home/alexlai/.oh-my-zsh

# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
 ZSH_THEME="arrow"
# ZSH_THEME="agnoster"

export EDITOR=nvim
export TERMCMD=termite

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=60
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git z tmux)

source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/z/z.sh
# source $ZSH/plugins/git/git.plugin.zsh#


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


# Functions
function cs() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && ls
}

