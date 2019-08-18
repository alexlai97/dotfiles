set -l home_path /home/alex
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$home_path/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
