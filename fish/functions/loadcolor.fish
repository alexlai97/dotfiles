function loadcolor
  if test -n $COLORLOADED 
    cat ~/.cache/wpgtk.sequences &
    set -g COLORLOADED 1
  end
end
