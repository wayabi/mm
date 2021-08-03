#!/bin/sh
LANG=en,utf-8
LC_MESSAGE=C

if [ $# -ge 1 ] && [ "$1" = "w" ]; then
  make clean > /dev/null
  make 2>&1 | grep -e "error" -e "warning" | head -n 5
else
  make 2>&1 | grep -e "error" | head -n 5
fi
