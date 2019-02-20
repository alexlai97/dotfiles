# Abbreviations
if status is-interactive
  # Common
  abbr --add ls exa
  abbr --add l exa -l -a
  abbr --add la exa -a
  abbr --add c clear
  abbr --add p ping -c 10 www.gentoo.org
  abbr --add dotabbr vim ~/.config/fish/abbr.fish
  abbr --add dotfish vim ~/.config/fish/config.fish
  abbr --add sshcs ssh -Y x7lai@ubuntu1604-004.student.cs.uwaterloo.ca
  abbr --add -- - 'cd -'
  abbr --add -- ... 'cd ../../'
  abbr --add -- .... 'cd ../../../'
  abbr --add h htop
  abbr --add his history
  abbr --add d cdh

  # git
  abbr --add g git
  abbr --add gaa git add --all
  abbr --add gst git status
  abbr --add gc git commit -v
  abbr --add gp git push
  abbr --add gl git pull

  # abduco
  abbr --add ab abduco

  # ranger
  abbr --add r ranger

  # dir operations
  abbr --add rd rmdir
  abbr --add md mkdir

  # info
  abbr --add info info --vi-keys
end

# Variables
export SSH='x7lai@linux.student.cs.uwaterloo.ca'
export WINTER_2019='/home/alex/Documents/School/Winter 2019'
export DOT_FILES='/home/alex/myrepos/dotfiles'
export SUCKLESS_REPO='/home/alex/myrepos/suckless_stuff'
export PLAYGROUND='/home/alex/myrepos/Playground'
