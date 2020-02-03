#!/bin/dash

CACHE_DIR="arch_pkglist-`date -Ihours`"
EXPLICIT_SORTED_PKGLIST_WITH_AUR="$CACHE_DIR/explicit_pkglist_with_aur.txt"
IMPLICIT_SORTED_PKGLIST_NO_AUR="$CACHE_DIR/implicit_pkglist_no_aur.txt"
EXPLICIT_SORTED_PKGLIST_NO_AUR="$CACHE_DIR/explicit_pkglist_no_aur.txt"
SORTED_AUR_PKGLIST="$CACHE_DIR/aur_pkglist.txt"

# clean up generated files
cleanup() {
  rm -r $CACHE_DIR 
}

# generate pkglist 
gen_pkglists() {
  pacman -Qqe | sort > $EXPLICIT_SORTED_PKGLIST_WITH_AUR
  pacman -Slq | sort > $IMPLICIT_SORTED_PKGLIST_NO_AUR
  comm -12 $EXPLICIT_SORTED_PKGLIST_WITH_AUR $IMPLICIT_SORTED_PKGLIST_NO_AUR > $EXPLICIT_SORTED_PKGLIST_NO_AUR
  comm -23 $EXPLICIT_SORTED_PKGLIST_WITH_AUR $EXPLICIT_SORTED_PKGLIST_NO_AUR > $SORTED_AUR_PKGLIST
}

usage() {
  EXE=$(basename $0)
  echo "Usage: $EXE (clean|gen|help)

  \`$EXE gen\` to generate files:
  - $EXPLICIT_SORTED_PKGLIST_NO_AUR: installed non-AUR packages
  - $SORTED_AUR_PKGLIST: installed AUR packages
"
}

# main
if [ ! -d $CACHE_DIR ]; then
  mkdir $CACHE_DIR
fi
case "$1" in 
  h|-h|--help|help) usage;;
  gen|g) gen_pkglists;;
  clean|c) cleanup;;
  *) usage;;
esac

