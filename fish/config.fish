set -l home_path /home/alex
set -xg PATH $home_path/.stack/programs/x86_64-linux/ghc-tinfo6-8.4.3/bin/ $home_path/.gem/ruby/2.4.0/bin /bin /usr/sbin/ $home_path/.scripts $home_path/.cargo/bin $home_path/.local/bin $home_path/.texlive/2019/bin/x86_64-linux/ /opt/bin /usr/local/bin /usr/bin /sbin/ 
set -xg XDG_CONFIG_home_path $home_path/.config
set -xg XDG_DATA_home_path $home_path/.local/share
set -xg MANPATH $home_path/.texlive/2019/texmf-dist/doc/man $home_path/share/man $home_path/.local/share/man /usr/local/share/man /usr/share/man /usr/share/gcc-data/x86_64-pc-linux-gnu/8.2.0/man
set -xg INFOPATH $home_path/.texlive/2019/texmf-dist/doc/info 
#set -xg DVTM_EDITOR $home_path/.scripts/dvtm-editor
set -xg _JAVA_AWT_WM_NONREPARENTING 1
set -xg JAVA_HOME /usr/lib/jvm/icedtea-bin-8/

set -xg EDITOR vi
set -xg BROWSER firefox-bin
set -xg TERMINAL st

export SSH="x7lai@linux.student.cs.uwaterloo.ca"
export SPRING_2019="$home_path/Documents/School/Spring 2019"
export DOT_FILES="$home_path/myrepos/dotfiles"
export SUCKLESS_REPO="$home_path/myrepos/suckless_stuff"
export PLAYGROUND="$home_path/myrepos/Playground"

bind -M insert \cf forward-char
