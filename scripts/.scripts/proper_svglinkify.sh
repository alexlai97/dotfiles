#!/bin/bash

if [[ $# != 2 ]]; then
  echo "Usage: $0 input.svg output.pdf"
  exit 1
fi

set -x

svglinkify $1 $2
pdftk $2 burst
mv pg_0001.pdf $2
rm doc_data.txt
