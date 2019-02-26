#!/bin/bash

FOLDER="$HOME/Pictures/Screenshots/"

if [ ! -d "${FOLDER}"  ]; then
  mkdir ${FOLDER}
fi

DATE=$(date +%Y-%m-%d@%H.%M.%S)
FNAME="${FOLDER}screenshot-${DATE}.png"
C=0
while [ -f "${FNAME}"  ] ; do
  FNAME="${FOLDER}screenshot-${DATE}.${C}.png"
  let C++
done

#touch ${FNAME}

preview () {
  n30f -s 0.2 -x 10 -y 10 -t "${FNAME}" "${FNAME}" -c "sxiv ${FNAME}" &
  sleep 10s && kill $! &
}

if [ $# -eq 0 ]; then
  OPTION=$(echo -e "window\nroot\ntime\nshow\nclean" | rofi -dmenu -p "screenshot mode")
else
  OPTION=$1
fi

case $OPTION in 
  "window"|"w")
    if sleep 0.1 && import "${FNAME}"; then
      preview
      notify-send "Window screenshot saved!" "Window screenshot was saved as:\n ${FNAME}"
    else
      notify-send "Window screenshot could not be saved!" "There was an error."
    fi
    ;;

  "root"|"r")
    if import -window root "${FNAME}"; then
      preview
      notify-send "Desktop screenshot saved!" "Desktop screenshot was saved as:\n ${FNAME}"
    else
      notify-send "Desktop screenshot could not be saved!" "There was an error."
    fi
    ;;

  "time"|"t")
    t=$(echo -e "3\n5\n10\n15\n30\n60\n120\n180\n1800\n3600" | rofi -dmenu -p "countdown")
    if [ -z $t ] ;then rofi -e "failed to capture time"; exit 1; fi
    notify-send "Count down $t seconds"
    sleep $t && import -window root "${FNAME}"
    if [ $? -eq 0 ]; then 
      preview 
      notify-send "Desktop screenshot saved!" "Desktop screenshot was saved as:\n ${FNAME}"
    else
      notify-send "Desktop screenshot could not be saved!" "There was an error."
    fi
    ;;

  "clean"|"c")
    num=$(ls $FOLDER/screenshot-*.png | wc -l)
    if [ $# -eq 0 ]; then 
      yesorno=$(echo -e "yes\nno" | rofi -dmenu -p "Are you sure to clean all $num screenshots? (y/n)")
    else
      read -n 1 -p "Are you sure to clean all $num screenshots? (y/n)" yesorno
    fi
    case $yesorno in 
      yes|y|Y ) 
        rm $FOLDER/screenshot-*.png 
        notify-send "Screenshots Cleaned" "$num screenshots has been deleted"
        ;;
      * ) exit 0 ;;
    esac
    ;;
  
  "show"|"s")
    sxiv $FOLDER/screenshot-*.png
    ;;

  *)
    echo $"Usage: $0 {window|w|root|r|clean|c|show|s}"
    exit 1
    ;;
esac

