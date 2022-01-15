function load_wpg_sequences
  if test (id -u) -eq 0
  # do nothing
  
  else if set -q VIFM
  # do nothing
  
  else if ! set -q TMUX
     if test -n $COLORLOADED 
       cat ~/.config/wpg/sequences &
       set -g COLORLOADED 1
     end
  
  end
end
