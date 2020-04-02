function load_wpg_sequences
  if test -n $COLORLOADED 
    cat ~/.config/wpg/sequences &
    set -g COLORLOADED 1
  end
end
